from rest_framework import serializers
from .models import Combo, Entrada

class CombosSerializer(serializers.ModelSerializer):
    class Meta:
        model = Combo
        fields = '__all__'


class EntradasSerializer(serializers.ModelSerializer):
    class Meta:
        model = Entrada
        fields = '__all__'