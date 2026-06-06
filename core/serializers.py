from rest_framework import serializers
from .models import Donor, PatientRequest, EmailResponse

class DonorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Donor
        fields = '__all__'

class PatientRequestSerializer(serializers.ModelSerializer):
    class Meta:
        model = PatientRequest
        fields = '__all__'
        
class EmailResponseSerializer(serializers.ModelSerializer):
    class Meta:
        model = EmailResponse
        fields = '__all__'