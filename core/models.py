from django.db import models
import random
import string
from django.utils import timezone
import random
import string

def generate_code():
    return ''.join(random.choices(string.digits, k=6))

class Donor(models.Model):
    name = models.CharField(max_length=100)
    cnic = models.CharField(max_length=13, default='0000000000000')
    email = models.EmailField()
    phone = models.CharField(max_length=20)
    gender = models.CharField(max_length=10, default='Unknown')
    blood_group = models.CharField(max_length=5)
    city = models.CharField(max_length=100)
    colony = models.CharField(max_length=100)
    full_address = models.TextField(default='Not provided')
    landmark = models.CharField(max_length=255, blank=True, default='')
    last_donation_date = models.DateField()
    is_profile_public = models.BooleanField(default=False)
    is_healthy = models.BooleanField(default=True)
    is_active = models.BooleanField(default=True)  # Add for soft deletion
    total_donations = models.IntegerField(default=0)
    created_at = models.DateTimeField(auto_now_add=True)
    latitude = models.FloatField(null=True, blank=True)
    longitude = models.FloatField(null=True, blank=True)

class PatientRequest(models.Model):
    patient_name = models.CharField(max_length=100, default='Unknown')
    cnic = models.CharField(max_length=13, default='0000000000000')
    phone = models.CharField(max_length=20, default='03000000000')
    gender = models.CharField(max_length=10, default='Unknown')
    required_blood_group = models.CharField(max_length=5, default='O+')
    units_needed = models.CharField(max_length=10, default='1')
    city = models.CharField(max_length=100, default='Unknown')
    colony = models.CharField(max_length=100, default='Unknown')
    hospital_name = models.CharField(max_length=255, default='Unknown Hospital')
    hospital_address = models.TextField(default='Not provided')
    landmark = models.CharField(max_length=255, blank=True, default='')
    urgency_level = models.CharField(max_length=20, default='Normal')
    case_details = models.TextField(blank=True, default='')
    created_at = models.DateTimeField(auto_now_add=True)
    status = models.CharField(max_length=20, default='Pending')
    fulfilled_date = models.DateField(null=True, blank=True)

    
    verification_code = models.CharField(
        max_length=6,
        default=generate_code,
        editable=False
    )

    
    is_fulfilled = models.BooleanField(default=False)

    def __str__(self):
        return f"{self.patient_name} - {self.required_blood_group} ({self.city})"


RESPONSE_CHOICES = [
    ('Available', 'Available'),
    ('Not Available', 'Not Available'),
    ('Email Sent', 'Email Sent'),
    ('ACCEPTED', 'Accepted'),  # Add more response options
    ('REJECTED', 'Rejected'),
]

class EmailResponse(models.Model):
    donor = models.ForeignKey(Donor, on_delete=models.CASCADE)
    request = models.ForeignKey(PatientRequest, on_delete=models.CASCADE)
    response_status = models.CharField(max_length=20, choices=RESPONSE_CHOICES)
    responded_at = models.DateTimeField(auto_now_add=True)