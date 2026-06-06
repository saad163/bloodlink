import urllib.parse
import urllib.request
import json
from rest_framework.generics import ListCreateAPIView
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.parsers import JSONParser
from django.shortcuts import render, get_object_or_404, redirect
from django.core.mail import send_mail
from django.conf import settings
from django.utils import timezone

from .models import Donor, PatientRequest, EmailResponse
from .serializers import DonorSerializer, PatientRequestSerializer, EmailResponseSerializer

# --- Helper Functions ---
def get_urgency_label(level):
    return {
        "1": "Emergency (need within 2 hours)",
        "2": "Critical (need within 6 hours)",
        "3": "Urgent (need within 12 hours)",
        "4": "Normal (need within 24 hours)"
    }.get(str(level), "Normal")

def geocode_address(colony, city):
    """
    Colony aur city ka combination say
    OpenStreetMap (Nominatim) se lat/lng laata hai.
    Agar koi result nahin mila, return (None, None).
    """
    address = f"{colony}, {city}, Pakistan"
    params = {
        'q': address,
        'format': 'json',
        'limit': 1
    }
    url = "https://nominatim.openstreetmap.org/search?" + urllib.parse.urlencode(params)
    headers = {'User-Agent': 'BloodLinkApp/1.0 (your_email@example.com)'}
    try:
        request = urllib.request.Request(url, headers=headers)
        with urllib.request.urlopen(request, timeout=5) as response:
            data = json.loads(response.read().decode())
            if data:
                lat = float(data[0]['lat'])
                lon = float(data[0]['lon'])
                return lat, lon
    except Exception as e:
        # Agar koi error aaye (timeout etc), to ignore karke (None, None) return karo
        print("Geocoding error:", e)
    return None, None

# --- HTML Page Views ---
def home(request):
    return render(request, 'index.html')

def donor_registration(request):
    if request.method == 'POST':
        # Extract form fields
        name = request.POST.get('name')
        blood_group = request.POST.get('blood_group')
        city = request.POST.get('city')
        colony = request.POST.get('colony')
        phone = request.POST.get('phone')
        email = request.POST.get('email')
        is_healthy = True if request.POST.get('is_healthy') == 'on' else False

        # Geocode to get latitude/longitude
        lat, lng = geocode_address(colony, city)

        # Create Donor instance
        Donor.objects.create(
            name=name,
            blood_group=blood_group,
            city=city,
            colony=colony,
            phone=phone,
            email=email,
            is_healthy=is_healthy,
            latitude=lat,
            longitude=lng
        )
        return redirect('donor-registration')  # Redirect back or to a "success" page

    return render(request, 'donor-registration.html')

def blood_request(request):
    return render(request, 'blood-request.html')

def portal(request):
    return render(request, 'donor-request-portal.html')

def map(request):
    return render(request, 'donor-map.html')

# --- Donor API ---
class DonorListCreateAPIView(ListCreateAPIView):
    serializer_class = DonorSerializer
    def get_queryset(self):
        queryset = Donor.objects.filter(is_active=True)

        blood_group = self.request.query_params.get('blood_group')
        city = self.request.query_params.get('city')
        colony = self.request.query_params.get('colony')

        if blood_group:
            queryset = queryset.filter(blood_group=blood_group)
        if city:
            queryset = queryset.filter(city__iexact=city)
        if colony:
            queryset = queryset.filter(colony__icontains=colony)

        return queryset

# --- Patient Request API ---
class PatientRequestListCreateAPIView(ListCreateAPIView):
    queryset = PatientRequest.objects.filter(is_fulfilled=False)
    serializer_class = PatientRequestSerializer
    parser_classes = [JSONParser]

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        req = serializer.save()

        # Find matching donors
        matches = Donor.objects.filter(
            blood_group=req.required_blood_group,
            city__iexact=req.city,
            colony__iexact=req.colony,
            is_healthy=True,
            is_active=True
        ).exclude(email='').distinct()

        emails = [d.email for d in matches if d.email]

        if emails:
            urgency_text = get_urgency_label(req.urgency_level)
            subject = "Blood Request Alert"
            message = (
                f"A patient ({req.patient_name}) needs {req.required_blood_group} blood in {req.city}.\n\n"
                f"Urgency Level: {urgency_text}\n"
                f"Hospital: {req.hospital_name}, {req.hospital_address}\n"
                f"Contact Phone: {req.phone}\n\n"
                "Please respond if you can donate. Thank you!"
            )
            html_message = f"""
                <h3>🚨 Blood Request Alert</h3>
                <p><strong>Patient:</strong> {req.patient_name}</p>
                <p><strong>Blood Group:</strong> {req.required_blood_group}</p>
                <p><strong>Urgency:</strong> {urgency_text}</p>
                <p><strong>Hospital:</strong> {req.hospital_name}, {req.hospital_address}</p>
                <p><strong>City:</strong> {req.city}</p>
                <p><strong>Contact:</strong> {req.phone}</p>
                <hr>
                <p>Please respond if you can donate. You may save a life! ❤️</p>
            """

            send_mail(
                subject=subject,
                message=message,
                from_email=settings.EMAIL_HOST_USER,
                recipient_list=emails,
                html_message=html_message,
                fail_silently=False
            )

            for donor in matches:
                EmailResponse.objects.create(
                    donor=donor,
                    request=req,
                    response_status="Email Sent"
                )

        # Prepare response data
        output = PatientRequestSerializer(req).data
        output['donors'] = [
            {
                "id": d.id,
                "name": d.name,
                "blood_group": d.blood_group,
                "city": d.city,
                "colony": d.colony,
                "phone": d.phone,
                "latitude": getattr(d, 'latitude', 0.0),
                "longitude": getattr(d, 'longitude', 0.0)
            }
            for d in matches
        ]

        return Response(output, status=status.HTTP_201_CREATED)

# --- Fulfill Request API ---
class FulfillRequestByPatientAPIView(APIView):
    def post(self, request):
        request_id = request.data.get('request_id')
        verification_code = request.data.get('verification_code')

        if not request_id or not verification_code:
            return Response(
                {"error": "Both request ID and verification code are required"},
                status=status.HTTP_400_BAD_REQUEST
            )

        try:
            patient_request = PatientRequest.objects.get(
                id=request_id,
                verification_code=verification_code,
                is_fulfilled=False
            )
            patient_request.is_fulfilled = True
            patient_request.fulfilled_date = timezone.now().date()
            patient_request.save()

            return Response(
                {"message": "Request marked as fulfilled successfully"},
                status=status.HTTP_200_OK
            )

        except PatientRequest.DoesNotExist:
            return Response(
                {"error": "Invalid request ID or verification code, or request already fulfilled"},
                status=status.HTTP_404_NOT_FOUND
            )

# --- Response Update API ---
class UpdateResponseAPIView(APIView):
    def post(self, request):
        serializer = EmailResponseSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({"message": "Response saved"}, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

# --- Dashboard Statistics API ---
class DashboardStatsAPIView(APIView):
    def get(self, request):
        stats = {
            "total_donors": Donor.objects.count(),
            "eligible_donors": Donor.objects.filter(is_healthy=True).count(),
            "active_requests": PatientRequest.objects.filter(is_fulfilled=False).count(),
            "fulfilled_requests": PatientRequest.objects.filter(is_fulfilled=True).count(),
            "cities_covered": Donor.objects.values('city').distinct().count(),
            "total_responses": EmailResponse.objects.count(),
        }
        return Response(stats)

# --- Email Log API (With Optional Filters) ---
class EmailLogListAPIView(APIView):
    def get(self, request):
        donor_id = request.query_params.get('donor_id')
        request_id = request.query_params.get('request_id')

        queryset = EmailResponse.objects.all()
        if donor_id:
            queryset = queryset.filter(donor__id=donor_id)
        if request_id:
            queryset = queryset.filter(request__id=request_id)

        serializer = EmailResponseSerializer(queryset, many=True)
        return Response(serializer.data)

# --- Optional: Deactivate Donor API ---
class DeactivateDonorAPIView(APIView):
    def post(self, request):
        donor_id = request.data.get('donor_id')
        donor = get_object_or_404(Donor, id=donor_id)
        donor.is_active = False
        donor.save()
        return Response({"message": "Donor deactivated"}, status=status.HTTP_200_OK)
