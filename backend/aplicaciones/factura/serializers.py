from rest_framework import serializers
from .models import Factura, ComprasCombos

class FacturaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Factura
        fields = '__all__'


class ComprasCompbosSerializer(serializers.ModelSerializer):
    class Meta:
        model = ComprasCombos
        fields = '__all__'