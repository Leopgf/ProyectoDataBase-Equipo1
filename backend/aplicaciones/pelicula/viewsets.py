from rest_framework import viewsets
from rest_framework import generics
from django.db.models import Prefetch
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

class UsuarioViewset(generics.ListAPIView):
    serializer_class = serializers.UsuariosSerializer
    def get_queryset(self):
        usuario = self.kwargs['cedula']
        return models.Usuario.objects.all().filter(cedula = usuario)


class CategoriaViewset(viewsets.ModelViewSet):
    queryset = models.Categoria.objects.all().filter(estado = True)
    serializer_class = serializers.CategoriasSerializer


class registroCategoriaViewset(generics.ListAPIView):
    serializer_class = serializers.CategoriasSerializer
    
    def get_queryset(self):
        pelicula = self.kwargs['id_pelicula']
        return models.Categoria.objects.all().filter(registrocategorias__id_pelicula = pelicula).filter(estado = True)      

    
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
    queryset = models.Producto.objects.all().filter(estado = True).exclude(id_tipos_productos = 3)
    serializer_class = serializers.ProductosSerializer

class CombosViewset(viewsets.ModelViewSet):
    queryset = models.Producto.objects.all().filter(estado = True).filter(id_tipos_productos = 3)
    serializer_class = serializers.ProductosSerializer


class registroCombosViewset(generics.ListAPIView):
    serializer_class = serializers.registroCombosSerializer
    def get_queryset(self):
        combo = self.kwargs['id_producto_combo']
        return models.registroCombos.objects.all().filter(id_producto_combo = combo)


class RegistroCombosAdminViewset(viewsets.ModelViewSet):
    queryset = models.registroCombos.objects.all()
    serializer_class = serializers.registroCombosAdminSerializer


class FacturaViewset(viewsets.ModelViewSet):
    queryset = models.Factura.objects.all()
    serializer_class = serializers.FacturaSerializer


class AlimentoViewset(viewsets.ModelViewSet):
    queryset = models.Alimento.objects.all()
    serializer_class = serializers.AlimentoSerializer


class EntradaViewset(viewsets.ModelViewSet):
    queryset = models.Entrada.objects.all()
    serializer_class = serializers.EntradaSerializer


class ComboCineViewset(viewsets.ModelViewSet):
    queryset = models.ComboCine.objects.all()
    serializer_class = serializers.ComboCineSerializer


class ClienteViewset(viewsets.ModelViewSet):
    queryset = models.Cliente.objects.all()
    serializer_class = serializers.ClienteSerializer


class EmpleadoViewset(viewsets.ModelViewSet):
    queryset = models.Empleado.objects.all()
    serializer_class = serializers.EmpleadoSerializer


class PromocionesViewset(viewsets.ModelViewSet):
    queryset = models.Promociones.objects.all().filter(estado = True)
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
