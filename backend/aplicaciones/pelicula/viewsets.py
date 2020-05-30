from rest_framework import viewsets
from . import models
from . import serializers

class PeliculaViewset(viewsets.ModelViewSet):
    queryset = models.Pelicula.objects.all()
    serializer_class = serializers.PeliculasSerializer

class FuncionViewset(viewsets.ModelViewSet):
    queryset = models.Funcion.objects.all()
    serializer_class = serializers.FuncionSerializer

class SalaViewset(viewsets.ModelViewSet):
    queryset = models.Sala.objects.all()
    serializer_class = serializers.SalaSerializer

class AsientoViewset(viewsets.ModelViewSet):
    queryset = models.Asiento.objects.all()
    serializer_class = serializers.AsientoSerializer

class ReservarAsientoViewset(viewsets.ModelViewSet):
    queryset = models.ReservarAsientos.objects.all()
    serializer_class = serializers.ReservarAsientoSerializer