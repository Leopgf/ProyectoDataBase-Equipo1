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

# SERIALIZER QUE TRAE TODOS LOS CAMPOS DE LAS ENTRADAS CON INFO DEL PRODUCTO
class EntradasInfoSerializer(serializers.ModelSerializer):
    producto = ProductosSerializer(source='id_producto')
    class Meta:
        model = Entrada
        fields = ['producto', 'tipo']

# SERIALIZER QUE TRAE TODOS LOS CAMPOS DE LOS COMBOS
class ComboCineSerializer(serializers.ModelSerializer):
    class Meta:
        model = ComboCine
        fields = '__all__'


# SERIALIZER QUE TRAE TODOS LOS CAMPOS DE LOS ALIMENTOS CON SU PRODUCTO
class AlimentoConProductoSerializer(serializers.ModelSerializer):
    producto = ProductosSerializer(source='id_producto')
    class Meta:
        model = Alimento
        fields = ['producto', 'contenido_neto']

    
# SERIALIZER QUE TRAE TODOS LOS CAMPOS DE LOS COMBOS
class ComboCineConProductoSerializer(serializers.ModelSerializer):
    producto = ProductosSerializer(source='id_producto')
    class Meta:
        model = ComboCine
        fields = ['producto', 'descripcion', 'descuento']


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

# SERIALIZER QUE TRAE TODOS LOS CAMPOS DE LOS CLIENTES CON SUS USUARIOS
class ClientesConUsuariosSerializer(serializers.ModelSerializer):
    usuario = UsuarioSerializer(source='id_usuario')
    class Meta:
        model = Cliente
        fields = ['usuario', 'id']

# SERIALIZER QUE TRAE TODOS LOS CAMPOS DE LOS EMPLEADOS
class EmpleadoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Empleado
        fields = '__all__'

# SERIALIZER QUE TRAE TODOS LOS CAMPOS DE LOS EMPLEADOS CON SUS USUARIOS
class EmpleadosConUsuariosSerializer(serializers.ModelSerializer):
    usuario = UsuarioSerializer(source='id_usuario')
    class Meta:
        model = Empleado
        fields = ['usuario', 'id']

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


# SERIALIZER QUE TRAE EL TITULO DE LA PELICULA
class TituloPeliculaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Pelicula
        fields = ['titulo']
        
# SERIALIZER QUE TRAE EL NOMBRE DE LA SUCURSAL
class NombreSucursalSerializer(serializers.ModelSerializer):
    class Meta:
        model = Sucursal
        fields = ['nombre']
        
# SERIALIZER QUE TRAE EL NOMBRE DE LA SALA
class NombreSalaSerializer(serializers.ModelSerializer):
    sucursal = NombreSucursalSerializer(source='id_sucursal')
    class Meta:
        model = Sala
        fields = ['sucursal', 'nombre']
        
# SERIALIZER QUE TRAE LA FECHA, HORA, PELICULA, SALA Y SUCURSAL DE LA FUNCION
class FuncionRepetidaSerializer(serializers.ModelSerializer):
    pelicula = TituloPeliculaSerializer(source='id_pelicula')
    sala = NombreSalaSerializer(source='id_sala')
    class Meta:
        model = Funcion
        fields = ('pelicula', 'sala', 'fecha', 'hora')
        
# SERIALIZER QUE TRAE EL TOP DE ASIENTOS
class AsientosTopSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField()
    asiento = serializers.CharField()
    cantidad_reservados = serializers.IntegerField()
    sala = serializers.CharField()
    sucursal = serializers.CharField()

    class Meta:
        model = RegistroAsientosReservados
        fields = ['id', 'asiento', 'cantidad_reservados', 'sala', 'sucursal']

#SERIALIZER QUE TRAE EL TOP PELICULAS
class TopPeliculasSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField()
    pelicula = serializers.CharField()
    veces_comprada = serializers.IntegerField()
    sucursal = serializers.CharField()

    class Meta:
        model = RegistroAsientosReservados
        fields = ['id', 'pelicula', 'veces_comprada', 'sucursal']

# SERIALIZAR QUE TRAE EL TOP PRODUCTOS
class TopProductosSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField()
    producto = serializers.CharField()
    cantidad_comprada = serializers.IntegerField()

    class Meta:
        model = RegistroCompras
        fields = ['id', 'producto', 'cantidad_comprada']

class TopSucursalesSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField()
    sucursal = serializers.CharField()
    visitantes = serializers.IntegerField()

    class Meta:
        model = RegistroAsientosReservados
        fields = ['id', 'sucursal', 'visitantes']


# SERIALIZAR QUE TRAE LA INFORMACIÓN DE LA FACTURA
class InfoFacturaSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField()
    fecha_factura = serializers.DateField()
    total = serializers.FloatField()
    fecha = serializers.DateField()
    hora = serializers.TimeField()
    pelicula = serializers.CharField()
    duracion = serializers.TimeField()
    ubicacion = serializers.CharField()
    cliente = serializers.CharField()
    puntos = serializers.IntegerField()

    class Meta:
        model = Factura
        fields = ['id', 'fecha_factura', 'total', 'fecha', 'hora', 'pelicula', 'duracion', 'ubicacion', 'cliente', 'puntos']

# SERIALIZER QUE TRAE LOS PRODUCTOS DE UNA FACTURA
class ProductosFacturaSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField()
    producto = serializers.CharField()
    precio = serializers.FloatField()
    tipo_producto = serializers.CharField()
    cantidad = serializers.IntegerField()

    class Meta:
        model = RegistroCompras
        fields = ['id', 'producto', 'precio', 'tipo_producto', 'cantidad']

# SERIALIZER QUE TRAE LOS ASIENTOS DE UNA FACTURA
class AsientosFacturaSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField()
    asiento = serializers.CharField()

    class Meta:
        model = RegistroAsientosReservados
        fields = ['id', 'asiento']

# SERIALIZER QUE TRAE LAS PROMOCIONES DE UNA FACTURA
class PromocionesFacturaSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField()
    descuento = serializers.IntegerField()
    promocion = serializers.CharField()

    class Meta:
        model = RegistroPromociones
        fields = ['id', 'descuento', 'promocion']


# SERIALIZER QUE TRAE LAS FACTURAS DEL ADMIN
class FacturasAdminSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField()
    fecha = serializers.DateField()
    cliente = serializers.CharField()

    class Meta:
        model = RegistroPromociones
        fields = ['id', 'fecha', 'cliente']

