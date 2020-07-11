from aplicaciones.pelicula.viewsets import FacturasAdminViewset, InfoFacturaViewset, PromocionesActivasViewset, FuncionesDisponiblesViewset, CategoriasTodasViewset, RegistroCategoriasTodasViewset, PeliculaTodasViewset, PeliculasEstrenadasViewset, PeliculasNoEstrenadasViewset, BuscadorPeliculaViewset, UsuariosViewset, CombosViewset, RegistroCombosTodosViewset, AlimentoViewset, EntradaViewset, ComboCineViewset, ClientesViewset, EmpleadosViewset, CategoriaViewset, RegistroCategoriaViewset, SucursalViewset, SalaViewset, FuncionViewset, AsientoViewset, TipoProductoViewset, ProductoViewset, RegistroCombosViewset, FacturaViewset, PromocionesViewset, RegistroPromocionesViewset, RegistroComprasViewset, RegistroAsientosReservadosViewset, TopAsientosViewSet, TopPeliculasViewset, TopProductoViewset, TopSucursalesViewset, AlimentoConProductoViewset, ComboCineConProductoViewset, ClientesConUsuariosViewset, EntradasInfoViewset, EmpleadosConUsuariosViewset

from rest_framework import routers

router = routers.DefaultRouter()

# RUTAS DE PELICULAS
router.register('peliculas-estrenadas',PeliculasEstrenadasViewset)
router.register('peliculas-todas',PeliculaTodasViewset)
router.register('peliculas-noestrenadas',PeliculasNoEstrenadasViewset)
router.register('peliculas-buscador',BuscadorPeliculaViewset)

# RUTAS CATEGORIAS
router.register('categorias-todas',CategoriasTodasViewset)
router.register('categorias',CategoriaViewset)
router.register('registrocategorias-todas',RegistroCategoriasTodasViewset)

# RUTAS SUCURSALES
router.register('sucursales',SucursalViewset)

# RUTAS SALAS
router.register('salas',SalaViewset)

# RUTAS ASIENTOS
router.register('asientos',AsientoViewset)

# RUTAS FUNCIONES
router.register('funciones',FuncionViewset)
router.register('funciones-disponibles',FuncionesDisponiblesViewset)

# RUTAS PRODUCTOS
router.register('tipoProductos',TipoProductoViewset)
router.register('productos',ProductoViewset)
router.register('combos',CombosViewset)
router.register('alimentos',AlimentoViewset)
router.register('alimentos-productos',AlimentoConProductoViewset)
router.register('combos-productos',ComboCineConProductoViewset)
router.register('entradas',EntradaViewset)
router.register('entradas-info',EntradasInfoViewset)
router.register('comboscine',ComboCineViewset)
router.register('registrocombos-todos',RegistroCombosTodosViewset)

# RUTAS PROMOCIONES
router.register('promociones',PromocionesViewset)
router.register('promociones-activas',PromocionesActivasViewset)

# RUTAS USUARIOS
router.register('usuarios',UsuariosViewset)
router.register('clientes',ClientesViewset)
router.register('empleados',EmpleadosViewset)

# RUTAS FACTURAS
router.register('facturas',FacturaViewset)
router.register('registroPromociones',RegistroPromocionesViewset)
router.register('registroCompras',RegistroComprasViewset)
router.register('registroAsientosReservados',RegistroAsientosReservadosViewset)

# RUTAS QUERYS YUKA
router.register('TopAsientos', TopAsientosViewSet, basename='TopAsientos')
router.register('TopPeliculas', TopPeliculasViewset, basename = 'TopPeliculas')
router.register('TopProductos', TopProductoViewset , basename = 'TopProducto')
router.register('TopSucursales', TopSucursalesViewset , basename = 'TopSucursales')