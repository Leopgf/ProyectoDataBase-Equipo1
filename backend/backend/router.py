from aplicaciones.pelicula.viewsets import PeliculaViewset, FuncionViewset, SalaViewset, AsientoViewset, ReservarAsientoViewset, EntradaViewset, ComboViewset, FacturaViewset, ComprasCombosViewset, ComprasEntradasViewset

from rest_framework import routers

router = routers.DefaultRouter()

#App Película
router.register('peliculas',PeliculaViewset)
router.register('funciones',FuncionViewset)
router.register('salas',SalaViewset)
router.register('asientos',AsientoViewset)
router.register('reservarAsientos',ReservarAsientoViewset)
router.register('entradas',EntradaViewset)

router.register('facturas',FacturaViewset)
router.register('comprasCombos',ComprasCombosViewset)
router.register('comprasEntradas',ComprasEntradasViewset)

router.register('combos',ComboViewset)

# router.register('usuario',UsuarioViewset)