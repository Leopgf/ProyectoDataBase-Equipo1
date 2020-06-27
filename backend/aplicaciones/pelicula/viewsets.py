from rest_framework import viewsets
from rest_framework import generics
from django_filters.rest_framework import DjangoFilterBackend
from . import models
from . import serializers
import datetime


class PeliculaViewset(viewsets.ModelViewSet):
    queryset = models.Pelicula.objects.all().filter(fecha_estreno__lte = datetime.date.today()).filter(fecha_salida__gte = datetime.date.today()).filter(estado = True)
    serializer_class = serializers.PeliculasSerializer

class PeliculaAdminViewset(viewsets.ModelViewSet):
    queryset = models.Pelicula.objects.all().filter(estado = True)
    serializer_class = serializers.PeliculasSerializer

class EstrenosViewset(viewsets.ModelViewSet):
    queryset = models.Pelicula.objects.all().filter(fecha_estreno__gte = datetime.date.today()).filter(estado = True)
    serializer_class = serializers.PeliculasSerializer

class UsuarioViewset(viewsets.ModelViewSet):
    queryset = models.Usuario.objects.all()
    serializer_class = serializers.UsuariosSerializer

class CategoriaViewset(viewsets.ModelViewSet):
    queryset = models.Categoria.objects.all()
    serializer_class = serializers.CategoriasSerializer


class registroCategoriaViewset(generics.ListAPIView):
    serializer_class = serializers.CategoriasSerializer
    
    def get_queryset(self):
        pelicula = self.kwargs['id_pelicula']
        return models.Categoria.objects.all().filter(registrocategorias__id_pelicula = pelicula)      

    
class SucursalViewset(viewsets.ModelViewSet):
    queryset = models.Sucursal.objects.all()
    serializer_class = serializers.SucursalesSerializer

class SalaViewset(viewsets.ModelViewSet):
    queryset = models.Sala.objects.all()
    serializer_class = serializers.SalaSerializer


class FuncionViewset(viewsets.ModelViewSet):
    queryset = models.Funcion.objects.all().filter(estado = True)
    serializer_class = serializers.FuncionSerializer


class AsientoViewset(viewsets.ModelViewSet):
    queryset = models.Asiento.objects.all()
    serializer_class = serializers.AsientoSerializer


class tipoProductoViewset(viewsets.ModelViewSet):
    queryset = models.tipoProductos.objects.all()
    serializer_class = serializers.tipoProductosSerializer


class ProductoViewset(viewsets.ModelViewSet):
    queryset = models.Producto.objects.all()
    serializer_class = serializers.ProductosSerializer

class CombosViewset(viewsets.ModelViewSet):
    queryset = models.Producto.objects.all().filter(estado = True).filter(id_tipos_productos_id = 3)
    serializer_class = serializers.ProductosSerializer


class registroCombosViewset(viewsets.ModelViewSet):
    queryset = models.registroCombos.objects.all()
    serializer_class = serializers.registroCombosSerializer


class FacturaViewset(viewsets.ModelViewSet):
    queryset = models.Factura.objects.all()
    serializer_class = serializers.FacturaSerializer


class PromocionesViewset(viewsets.ModelViewSet):
    queryset = models.Promociones.objects.all()
    serializer_class = serializers.PromocionesSerializer


class registroPromocionesViewset(viewsets.ModelViewSet):
    queryset = models.registroPromociones.objects.all()
    serializer_class = serializers.registroPromocionesSerializer


class registroComprasViewset(viewsets.ModelViewSet):
    queryset = models.registroCompras.objects.all()
    serializer_class = serializers.registroComprasSerializer


class registroAsientosReservadosViewset(viewsets.ModelViewSet):
    queryset = models.registroAsientosReservados.objects.all()
    serializer_class = serializers.registroAsientosReservadosSerializer
