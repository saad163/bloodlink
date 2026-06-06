from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from .views import (
    home,
    donor_registration,
    blood_request,
    portal,
    map,
    DonorListCreateAPIView,
    PatientRequestListCreateAPIView,
    FulfillRequestByPatientAPIView,
    UpdateResponseAPIView,
    EmailLogListAPIView,
    DashboardStatsAPIView
)

urlpatterns = [
    path('', home, name='home'),
    path('index.html', home),
    path('donor-registration.html', donor_registration, name='donor-registration'),
    path('blood-request.html', blood_request, name='blood-request'),
    path('portal/', portal, name='portal'),
    path('map/', map, name='donor-map'),

    path('api/donors/', DonorListCreateAPIView.as_view(), name='api-donors'),
    path('api/requests/', PatientRequestListCreateAPIView.as_view(), name='api-requests'),
    path('api/fulfill-request/', FulfillRequestByPatientAPIView.as_view(), name='api-fulfill'),
    path('api/responses/', UpdateResponseAPIView.as_view(), name='api-responses'),
    path('api/responses/all/', EmailLogListAPIView.as_view(), name='api-email-log'),
    path('api/dashboard/', DashboardStatsAPIView.as_view(), name='api-dashboard'),
]

if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATICFILES_DIRS[0])