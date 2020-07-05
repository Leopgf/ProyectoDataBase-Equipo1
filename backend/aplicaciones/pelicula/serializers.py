from rest_framework import serializers
from django.contrib.auth.hashers import make_password

from .models import Usuario, Pelicula, Categoria, Alimento, Entrada, Cliente, ComboCine, Empleado, registroCategorias, Sucursal, Sala, Funcion, Asiento, tipoProductos, Producto, registroCombos, Factura, Promociones, registroPromociones, registroCompras, registroAsientosReservados


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


class AlimentoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Alimento
        fields = '__all__'


class EntradaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Entrada
        fields = '__all__'


class ComboCineSerializer(serializers.ModelSerializer):
    class Meta:
        model = ComboCine
        fields = '__all__'


class ClienteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cliente
        fields = '__all__'


class EmpleadoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Empleado
        fields = '__all__'


class UsuarioSerializer(serializers.ModelSerializer):
    class Meta:
        model = Usuario
        fields = '__all__'


class ProductosRegistroCombosSerializer(serializers.ModelSerializer):
    class Meta:
        model = Producto
        fields = ['nombre', 'estado']


class registroCombosSerializer(serializers.ModelSerializer):
    producto = ProductosRegistroCombosSerializer(source='id_producto')
    class Meta:
        model = registroCombos
        fields = ['producto', 'cantidad']


class registroCombosAdminSerializer(serializers.ModelSerializer):
    class Meta:
        model = registroCombos
        fields = '__all__'


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




