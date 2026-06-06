from django.contrib import admin
from .models import Donor, PatientRequest, EmailResponse

admin.site.register(Donor)
admin.site.register(PatientRequest)
admin.site.register(EmailResponse)
