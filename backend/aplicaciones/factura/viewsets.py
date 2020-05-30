from rest_framework import viewsets
from . import models
from . import serializers

class FacturaViewset(viewsets.ModelViewSet):
    queryset = models.Factura.objects.all()
    serializer_class = serializers.FacturaSerializer

class ComprasCombosViewset(viewsets.ModelViewSet):
    queryset = models.ComprasCombos.objects.all()
    serializer_class = serializers.ComprasCompbosSerializer