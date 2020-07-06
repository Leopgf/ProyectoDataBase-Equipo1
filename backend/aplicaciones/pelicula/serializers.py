from rest_framework import serializers
from django.contrib.auth.hashers import make_password

from .models import Usuario, Pelicula, Categoria, Alimento, Entrada, Cliente, ComboCine, Empleado, RegistroCategorias, Sucursal, Sala, Funcion, Asiento, TipoProductos, Producto, RegistroCombos, Factura, Promociones, RegistroPromociones, RegistroCompras, RegistroAsientosReservados

# SERIALIZER CON TODOS LOS CAMPOS DE LAS PELICULAS
class PeliculasSerializer(serializers.ModelSerializer):
    class Meta:
        model = Pelicula
        fields = '__all__'

# SERIALIZER CON TODOS LOS CAMPOS DE LAS CATEGORIAS
class CategoriasSerializer(serializers.ModelSerializer):
    class Meta:
        model = Categoria
        fields = '__all__'

# SERIALIZER CON TODOS LOS CAMPOS DE REGISTROCATEGORIAS
class RegistroCategoriasTodasSerializer(serializers.ModelSerializer):
   class Meta:
        model = RegistroCategorias
        fields = '__all__'

# SERIALIZER QUE SOLO TRAE EL CAMPO DEL ID DE LA CATEGORIA EN LA TABLA DE REGISTROCATEGORIAS
class RegistroCategoriasSerializer(serializers.ModelSerializer):
   class Meta:
        model = RegistroCategorias
        fields = ['id_categoria']

# SERIALIZER QUE TRAE TODOS LOS CAMPOS DE LAS SUCURSALES
class SucursalesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Sucursal
        fields = '__all__'

# SERIALIZER QUE TRAE TODOS LOS CAMPOS DE LAS SALAS
class SalaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Sala
        fields = '__all__'

# SERIALIZER QUE TRAE TODOS LOS CAMPOS DE LOS ASIENTOS
class AsientoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Asiento
        fields = '__all__'

# SERIALIZER QUE TRAE TODOS LOS CAMPOS DE LAS FUNCIONES
class FuncionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Funcion
        fields = '__all__'

# SERIALIZER QUE TRAE TODOS LOS CAMPOS DE LOS TIPOS DE PRODUCTOS
class TipoProductosSerializer(serializers.ModelSerializer):
    class Meta:
        model = TipoProductos
        fields = '__all__'

# SERIALIZER QUE TRAE TODOS LOS CAMPOS DE LOS PRODUCTOS
class ProductosSerializer(serializers.ModelSerializer):
    class Meta:
        model = Producto
        fields = '__all__'

# SERIALIZER QUE TRAE TODOS LOS CAMPOS DE LOS ALIMENTOS
class AlimentoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Alimento
        fields = '__all__'

# SERIALIZER QUE TRAE TODOS LOS CAMPOS DE LAS ENTRADAS
class EntradaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Entrada
        fields = '__all__'

# SERIALIZER QUE TRAE TODOS LOS CAMPOS DE LOS COMBOS
class ComboCineSerializer(serializers.ModelSerializer):
    class Meta:
        model = ComboCine
        fields = '__all__'

# SERIALIZER QUE TRAE LOS CAMPOS NOMBRE Y ESTADO DE LOS PRODUCTOS
class ProductosRegistroCombosSerializer(serializers.ModelSerializer):
    class Meta:
        model = Producto
        fields = ['nombre', 'estado']

# SERIALIZER QUE TRAE EL PRODUCTO Y LA CANTIDAD DEL PRODUCTO EN LA TABLA DE REGISTROCOMBOS
class RegistroCombosSerializer(serializers.ModelSerializer):
    producto = ProductosRegistroCombosSerializer(source='id_producto')
    class Meta:
        model = RegistroCombos
        fields = ['producto', 'cantidad']

# SERIALIZER QUE TRAE TODOS LOS CAMPOS DE LA TABLA REGISTROCOMBOS
class RegistroCombosAdminSerializer(serializers.ModelSerializer):
    class Meta:
        model = RegistroCombos
        fields = '__all__'

# SERIALIZER QUE TRAE TODOS LOS CAMPOS DE LOS USUARIOS
class UsuarioSerializer(serializers.ModelSerializer):
    class Meta:
        model = Usuario
        fields = '__all__'

# SERIALIZER QUE TRAE TODOS LOS CAMPOS DE LOS CLIENTES
class ClienteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cliente
        fields = '__all__'

# SERIALIZER QUE TRAE TODOS LOS CAMPOS DE LOS EMPLEADOS
class EmpleadoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Empleado
        fields = '__all__'

# SERIALIZER QUE TRAE TODOS LOS CAMPOS DE LAS FACTURAS
class FacturaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Factura
        fields = '__all__'

# SERIALIZER QUE TRAE TODOS LOS CAMPOS DE LAS PROMOCIONES
class PromocionesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Promociones
        fields = '__all__'

# SERIALIZER QUE TRAE TODOS LOS CAMPOS DE REGISTROPROMOCIONES
class RegistroPromocionesSerializer(serializers.ModelSerializer):
    class Meta:
        model = RegistroPromociones
        fields = '__all__'

# SERIALIZER QUE TRAE TODOS LOS CAMPOS DE REGISTROCOMPRAS
class RegistroComprasSerializer(serializers.ModelSerializer):
    class Meta:
        model = RegistroCompras
        fields = '__all__'

# SERIALIZER QUE TRAE TODOS LOS CAMPOS DE REGISTROASIENTOS
class RegistroAsientosReservadosSerializer(serializers.ModelSerializer):
    class Meta:
        model = RegistroAsientosReservados
        fields = '__all__'