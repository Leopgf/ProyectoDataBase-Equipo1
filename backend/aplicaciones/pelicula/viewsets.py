from rest_framework import viewsets, generics, filters
from . import models
from . import serializers
import datetime

# TODAS LAS PELICULAS ACTIVAS
class PeliculaTodasViewset(viewsets.ModelViewSet):
    queryset = models.Pelicula.objects.all().filter(estado = True)
    serializer_class = serializers.PeliculasSerializer


# SOLO PELICULAS ESTRENADAS ACTIVAS
class PeliculasEstrenadasViewset(viewsets.ModelViewSet):
    queryset = models.Pelicula.objects.all().filter(fecha_estreno__lte = datetime.date.today()).filter(fecha_salida__gte = datetime.date.today()).filter(estado = True)
    serializer_class = serializers.PeliculasSerializer
    

# SOLO PELICULAS DE PROXIMOS ESTRENOS ACTIVOS
class PeliculasNoEstrenadasViewset(viewsets.ModelViewSet):
    queryset = models.Pelicula.objects.all().filter(fecha_estreno__gt = datetime.date.today()).filter(estado = True)
    serializer_class = serializers.PeliculasSerializer


# BUSCADOR DE PELICULAS ACTIVAS
class BuscadorPeliculaViewset(viewsets.ModelViewSet):
    queryset = models.Pelicula.objects.all().filter(estado = True)
    serializer_class = serializers.PeliculasSerializer
    filter_backends = [filters.SearchFilter]
    search_fields = ['titulo']
    

# TODAS LAS CATEGORIAS ACTIVAS
class CategoriaViewset(viewsets.ModelViewSet):
    queryset = models.Categoria.objects.all().filter(estado = True)
    serializer_class = serializers.CategoriasSerializer

# TODAS LAS CATEGORIAS
class CategoriasTodasViewset(viewsets.ModelViewSet):
    queryset = models.Categoria.objects.all()
    serializer_class = serializers.CategoriasSerializer


# DEVUELVE LA CATEGORIA ELIMINADA DADA LA CATEGORIA
class CategoriaEliminadaViewset(generics.ListAPIView):
    serializer_class = serializers.CategoriasSerializer
    
    def get_queryset(self):
        category = self.kwargs['categoria']
        return models.Categoria.objects.all().filter(categoria = category).filter(estado = False)      


# TODAS LOS REGISTROSCATEGORIAS
class RegistroCategoriasTodasViewset(viewsets.ModelViewSet):
    queryset = models.RegistroCategorias.objects.all()
    serializer_class = serializers.RegistroCategoriasTodasSerializer


# DEVUELVE LA CATEGORIA DE UNA PELICULA
class RegistroCategoriaViewset(generics.ListAPIView):
    serializer_class = serializers.CategoriasSerializer
    
    def get_queryset(self):
        pelicula = self.kwargs['id_pelicula']
        return models.Categoria.objects.all().filter(registrocategorias__id_pelicula = pelicula).filter(estado = True)      


# TODAS LAS SUCURSALES
class SucursalViewset(viewsets.ModelViewSet):
    queryset = models.Sucursal.objects.all()
    serializer_class = serializers.SucursalesSerializer


# TODAS LAS SALAS
class SalaViewset(viewsets.ModelViewSet):
    queryset = models.Sala.objects.all()
    serializer_class = serializers.SalaSerializer


# TODOS LOS ASIENTOS
class AsientoViewset(viewsets.ModelViewSet):
    queryset = models.Asiento.objects.all()
    serializer_class = serializers.AsientoSerializer

# TODOS LOS ASIENTOS DE UNA SALA
class AsientosSalaViewset(generics.ListAPIView):
    serializer_class = serializers.AsientoSerializer
    def get_queryset(self):
        sala = self.kwargs['id_sala']
        asientos_sala = models.Asiento.objects.all().filter(id_sala = sala)
        return asientos_sala

# TODOS LOS ASIENTOS DE UNA SALA OCUPADOS
class AsientosOcupadosViewset(generics.ListAPIView):
    serializer_class = serializers.RegistroAsientosReservadosSerializer
    def get_queryset(self):
        funcion = self.kwargs['id_funcion']
        asientos_ocupados = models.RegistroAsientosReservados.objects.all().filter(id_funciones = funcion)
        return asientos_ocupados

# TODAS LAS FUNCIONES
class FuncionViewset(viewsets.ModelViewSet):
    queryset = models.Funcion.objects.all().filter(estado = True)
    serializer_class = serializers.FuncionSerializer


# TODAS LAS FUNCIONES QUE NO HAN PASADO
class FuncionesDisponiblesViewset(viewsets.ModelViewSet):
    queryset = models.Funcion.objects.all().filter(estado = True).filter(fecha__gte = datetime.date.today())
    serializer_class = serializers.FuncionSerializer


# TODAS LAS FUNCIONES DE UNA PELICULA ESPECÍFICA
class FuncionPorPeliculaViewset(generics.ListAPIView):
    serializer_class = serializers.FuncionSerializer
    def get_queryset(self):
        pelicula = self.kwargs['id_pelicula']
        return models.Funcion.objects.all().filter(id_pelicula = pelicula).filter(estado = True).filter(fecha__gte = datetime.date.today())


# DEVUELVE SI HAY UNA FUNCIÓN EN EL BLOQUE HORARIO DE ESA PELICULA
class FuncionOcupadaViewset(generics.ListAPIView):
    serializer_class = serializers.FuncionRepetidaSerializer
    def get_queryset(self):
        sala = self.kwargs['id_sala']
        fecha_add = self.kwargs['fecha']
        hora_add = self.kwargs['hora']
        return models.Funcion.objects.all().filter(estado = True).filter(id_sala = sala).filter(fecha = fecha_add).filter(hora = hora_add)


# TODOS LOS TIPOS DE PRODUCTOS
class TipoProductoViewset(viewsets.ModelViewSet):
    queryset = models.TipoProductos.objects.all()
    serializer_class = serializers.TipoProductosSerializer

# TODOS LOS ALIMENTOS Y ENTRADAS QUE ESTÉN ACTIVOS
class ProductoViewset(viewsets.ModelViewSet):
    queryset = models.Producto.objects.all().filter(estado = True).exclude(id_tipos_productos = 3)
    serializer_class = serializers.ProductosSerializer


# TODOS LOS COMBOS
class CombosViewset(viewsets.ModelViewSet):
    queryset = models.Producto.objects.all().filter(estado = True).filter(id_tipos_productos = 3)
    serializer_class = serializers.ProductosSerializer


# DEVUELVE LOS ID DE LOS PRODUCTOS DE UN COMBO ESPECÍFICO
class RegistroCombosViewset(generics.ListAPIView):
    serializer_class = serializers.RegistroCombosSerializer
    def get_queryset(self):
        combo = self.kwargs['id_producto_combo']
        return models.RegistroCombos.objects.all().filter(id_producto_combo = combo)

# DEVUELVE TODOS LOS PRODUCTOS DE TODOS LOS COMBOS
class RegistroCombosTodosViewset(viewsets.ModelViewSet):
    queryset = models.RegistroCombos.objects.all()
    serializer_class = serializers.RegistroCombosAdminSerializer


# TODOS LOS ALIMENTOS
class AlimentoViewset(viewsets.ModelViewSet):
    queryset = models.Alimento.objects.all()
    serializer_class = serializers.AlimentoSerializer


# TODOS LAS ENTRADAS
class EntradaViewset(viewsets.ModelViewSet):
    queryset = models.Entrada.objects.all()
    serializer_class = serializers.EntradaSerializer


# TODOS LAS ENTRADAS CON SU INFO DE PRODUCTO
class EntradasInfoViewset(viewsets.ModelViewSet):
    queryset = models.Entrada.objects.all()
    serializer_class = serializers.EntradasInfoSerializer


# TODOS LAS ENTRADAS
class EntradaViewset(viewsets.ModelViewSet):
    queryset = models.Entrada.objects.all()
    serializer_class = serializers.EntradaSerializer


# TODOS LOS COMBOS
class ComboCineViewset(viewsets.ModelViewSet):
    queryset = models.ComboCine.objects.all()
    serializer_class = serializers.ComboCineSerializer


# TODOS LOS USUARIOS
class UsuariosViewset(viewsets.ModelViewSet):
    queryset = models.Usuario.objects.all()
    serializer_class = serializers.UsuarioSerializer


# DEVUELVE UN USUARIO A PARTIR DE SU CEDULA
class UsuarioViewset(generics.ListAPIView):
    serializer_class = serializers.UsuarioSerializer
    def get_queryset(self):
        usuario = self.kwargs['cedula']
        return models.Usuario.objects.all().filter(cedula = usuario)


# TODOS LOS CLIENTES
class ClientesViewset(viewsets.ModelViewSet):
    queryset = models.Cliente.objects.all()
    serializer_class = serializers.ClienteSerializer


# DEVUELVE UN CLIENTE A PARTIR DE SU CEDULA CON SU USUARIO CORRESPONDIENTE
class IniciarSesionClienteViewset(generics.ListAPIView):
    serializer_class = serializers.ClienteSerializer
    def get_queryset(self):
        cedulaUser = self.kwargs['cedula']
        user = models.Usuario.objects.all().filter(cedula = cedulaUser)[0].id
        return models.Cliente.objects.all().filter(id_usuario = user)


# DEVUELVE UN CLIENTE A PARTIR DE SU ID_USUARIO
class IdUsuarioClienteViewset(generics.ListAPIView):
    serializer_class = serializers.ClienteSerializer
    def get_queryset(self):
        idUser = self.kwargs['id_usuario']
        return models.Cliente.objects.all().filter(id_usuario = idUser)


# TODOS LOS EMPLEADOS
class EmpleadosViewset(viewsets.ModelViewSet):
    queryset = models.Empleado.objects.all()
    serializer_class = serializers.EmpleadoSerializer

# TODOS LOS EMPLEADOS CON SUS USUARIOS
class EmpleadosConUsuariosViewset(viewsets.ModelViewSet):
    queryset = models.Empleado.objects.all()
    serializer_class = serializers.EmpleadosConUsuariosSerializer

# TODOS LOS CLIENTES CON SUS USUARIOS
class ClientesConUsuariosViewset(viewsets.ModelViewSet):
    queryset = models.Cliente.objects.all()
    serializer_class = serializers.ClientesConUsuariosSerializer


# DEVUELVE UN EMPLEADO A PARTIR DE SU CEDULA
class IniciarSesionEmpleadoViewset(generics.ListAPIView):
    serializer_class = serializers.EmpleadoSerializer
    def get_queryset(self):
        cedulaUser = self.kwargs['cedula']
        user = models.Usuario.objects.all().filter(cedula = cedulaUser)[0].id
        return models.Empleado.objects.all().filter(id_usuario = user)


# DEVUELVE UN EMPLEADO A PARTIR DE SU ID_USUARIO
class IdUsuarioEmpleadoViewset(generics.ListAPIView):
    serializer_class = serializers.EmpleadoSerializer
    def get_queryset(self):
        idUser = self.kwargs['id_usuario']
        return models.Empleado.objects.all().filter(id_usuario = idUser)


# TODAS LAS FACTURAS
class FacturaViewset(viewsets.ModelViewSet):
    queryset = models.Factura.objects.all()
    serializer_class = serializers.FacturaSerializer


# TODAS LAS PROMOCIONES
class PromocionesViewset(viewsets.ModelViewSet):
    queryset = models.Promociones.objects.all().filter(estado = True)
    serializer_class = serializers.PromocionesSerializer

# TODAS LAS PROMOCIONES ACTIVAS 
class PromocionesActivasViewset(viewsets.ModelViewSet):
    queryset = models.Promociones.objects.all().filter(estado = True).filter(fecha_inicio__lte = datetime.date.today()).filter(fecha_fin__gte = datetime.date.today())
    serializer_class = serializers.PromocionesSerializer


# TODOS LOS REGISTROS DE PROMOCIONES EN FACTURAS
class RegistroPromocionesViewset(viewsets.ModelViewSet):
    queryset = models.RegistroPromociones.objects.all()
    serializer_class = serializers.RegistroPromocionesSerializer


# TODOS LOS REGISTROS DE LAS COMPRAS
class RegistroComprasViewset(viewsets.ModelViewSet):
    queryset = models.RegistroCompras.objects.all()
    serializer_class = serializers.RegistroComprasSerializer


# TODOS LOS REGISTROS DE LOS ASIENTOS
class RegistroAsientosReservadosViewset(viewsets.ModelViewSet):
    queryset = models.RegistroAsientosReservados.objects.all()
    serializer_class = serializers.RegistroAsientosReservadosSerializer

# TODOS LOS ASIENTOS DE UNA SALA
class AsientosDeSalaViewset(generics.ListAPIView):
    serializer_class = serializers.AsientoSerializer
    def get_queryset(self):
        Sala = self.kwargs['id_sala']
        return models.Asiento.objects.all().filter(id_sala = Sala)

