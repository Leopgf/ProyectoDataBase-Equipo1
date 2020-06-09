from rest_framework import viewsets
from . import models
from . import serializers
import datetime

class PeliculaViewset(viewsets.ModelViewSet):
    queryset = models.Pelicula.objects.all().filter(estado = True)
    serializer_class = serializers.PeliculasSerializer

class EstrenadaViewset(viewsets.ModelViewSet):
    queryset = models.Pelicula.objects.all().filter(fecha_estreno__lte = datetime.date.today()).filter(fecha_salida__gte = datetime.date.today()).filter(estado = True)
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

class EntradaViewset(viewsets.ModelViewSet):
    queryset = models.Entrada.objects.all()
    serializer_class = serializers.EntradasSerializer    

class ComboViewset(viewsets.ModelViewSet):
    queryset = models.Combo.objects.all()
    serializer_class = serializers.CombosSerializer

class FacturaViewset(viewsets.ModelViewSet):
    queryset = models.Factura.objects.all()
    serializer_class = serializers.FacturaSerializer

class ComprasCombosViewset(viewsets.ModelViewSet):
    queryset = models.ComprasCombos.objects.all()
    serializer_class = serializers.ComprasCombosSerializer

class ComprasEntradasViewset(viewsets.ModelViewSet):
    queryset = models.ComprasEntradas.objects.all()
    serializer_class = serializers.ComprasEntradasSerializer

class EstrenosViewset(viewsets.ModelViewSet):
    queryset = models.Pelicula.objects.all().filter(fecha_estreno__gte = datetime.date.today()).filter(estado = True)
    serializer_class = serializers.PeliculasSerializer