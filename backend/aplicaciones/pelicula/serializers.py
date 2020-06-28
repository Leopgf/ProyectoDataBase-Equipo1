from rest_framework import serializers
from django.contrib.auth.hashers import make_password

from .models import Usuario, Pelicula, Categoria, registroCategorias, Sucursal, Sala, Funcion, Asiento, tipoProductos, Producto, registroCombos, Factura, Promociones, registroPromociones, registroCompras, registroAsientosReservados


class UsuariosSerializer(serializers.ModelSerializer):
    class Meta:
        model = Usuario
        fields = '__all__'

class PeliculasSerializer(serializers.ModelSerializer):
    class Meta:
        model = Pelicula
        fields = '__all__'


class CategoriasSerializer(serializers.ModelSerializer):
    class Meta:
        model = Categoria
        fields = '__all__'


class registroCategoriasSerializer(serializers.ModelSerializer):
   class Meta:
        model = registroCategorias
        fields = ['id_categoria']


class SucursalesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Sucursal
        fields = '__all__'


class SalaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Sala
        fields = '__all__'


class FuncionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Funcion
        fields = '__all__'


class AsientoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Asiento
        fields = '__all__'


class tipoProductosSerializer(serializers.ModelSerializer):
    class Meta:
        model = tipoProductos
        fields = '__all__'


class ProductosSerializer(serializers.ModelSerializer):
    class Meta:
        model = Producto
        fields = '__all__'


class registroCombosSerializer(serializers.ModelSerializer):
    class Meta:
        model = Producto
        fields = ['nombre']


class FacturaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Factura
        fields = '__all__'


class PromocionesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Promociones
        fields = '__all__'


class registroPromocionesSerializer(serializers.ModelSerializer):
    class Meta:
        model = registroPromociones
        fields = '__all__'


class registroComprasSerializer(serializers.ModelSerializer):
    class Meta:
        model = registroCompras
        fields = '__all__'


class registroAsientosReservadosSerializer(serializers.ModelSerializer):
    class Meta:
        model = registroAsientosReservados
        fields = '__all__'




