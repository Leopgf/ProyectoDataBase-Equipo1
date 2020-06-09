from aplicaciones.pelicula.viewsets import PeliculaViewset, EstrenadaViewset, FuncionViewset, SalaViewset, AsientoViewset, ReservarAsientoViewset, EntradaViewset, ComboViewset, ComprasCombosViewset, ComprasEntradasViewset, FacturaViewset, EstrenosViewset

from rest_framework import routers

router = routers.DefaultRouter()

#App Película
router.register('funciones',FuncionViewset)
router.register('peliculas',PeliculaViewset)
router.register('estrenadas',EstrenadaViewset)
router.register('salas',SalaViewset)
# router.register('asientos',AsientoViewset)
# router.register('reservarAsientos',ReservarAsientoViewset)
# router.register('entradas',EntradaViewset)
router.register('estrenos',EstrenosViewset)

#App Combos
router.register('combos',ComboViewset)

#App Factura
# router.register('facturas',FacturaViewset)
# router.register('compras-combos',ComprasCombosViewset)
# router.register('compras-entradas',ComprasEntradasViewset)