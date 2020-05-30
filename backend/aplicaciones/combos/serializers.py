from rest_framework import serializers
from .models import Combo

class CombosSerializer(serializers.ModelSerializer):
    class Meta:
        model = Combo
        fields = '__all__'