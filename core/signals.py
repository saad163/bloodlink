import requests
from django.db.models.signals import pre_save
from django.dispatch import receiver
from .models import Donor

@receiver(pre_save, sender=Donor)
def geocode_donor(sender, instance, **kwargs):
    if not instance.latitude or not instance.longitude:
        address = f"{instance.colony}, {instance.city}"
        resp = requests.get(
            "https://nominatim.openstreetmap.org/search",
            params={"q": address, "format": "json"}
        ).json()
        if resp:
            instance.latitude = resp[0]["lat"]
            instance.longitude = resp[0]["lon"]
