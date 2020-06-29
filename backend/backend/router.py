from aplicaciones.pelicula.viewsets import  CombosViewset, PeliculaViewset, PeliculaAdminViewset, EstrenosViewset, CategoriaViewset, registroCategoriaViewset, SucursalViewset, SalaViewset, FuncionViewset, AsientoViewset, tipoProductoViewset, ProductoViewset, registroCombosViewset, FacturaViewset, PromocionesViewset, registroPromocionesViewset, registroComprasViewset, registroAsientosReservadosViewset

from rest_framework import routers

router = routers.DefaultRouter()



router.register('peliculas',PeliculaViewset)
router.register('peliculas-admin',PeliculaAdminViewset)
router.register('estrenos',EstrenosViewset)
router.register('categorias',CategoriaViewset)
router.register('sucursales',SucursalViewset)
router.register('salas',SalaViewset)
router.register('funciones',FuncionViewset)
router.register('asientos',AsientoViewset)
router.register('tipoProductos',tipoProductoViewset)
router.register('productos',ProductoViewset)
router.register('combos',CombosViewset)
router.register('facturas',FacturaViewset)
router.register('promociones',PromocionesViewset)
router.register('registroPromociones',registroPromocionesViewset)
router.register('registroCompras',registroComprasViewset)
router.register('registroAsientosReservados',registroAsientosReservadosViewset)
