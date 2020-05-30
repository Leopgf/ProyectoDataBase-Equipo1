from rest_framework import viewsets
from . import models
from . import serializers

class ComboViewset(viewsets.ModelViewSet):
    queryset = models.Combo.objects.all()
    serializer_class = serializers.CombosSerializer

class EntradaViewset(viewsets.ModelViewSet):
    queryset = models.Entrada.objects.all()
    serializer_class = serializers.EntradasSerializer