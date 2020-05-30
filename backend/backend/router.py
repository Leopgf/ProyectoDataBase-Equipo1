from aplicaciones.pelicula.viewsets import PeliculaViewset, FuncionViewset, SalaViewset, AsientoViewset, ReservarAsientoViewset
from aplicaciones.combos.viewsets import ComboViewset, EntradaViewset
from aplicaciones.factura.viewsets import FacturaViewset, ComprasCombosViewset

from rest_framework import routers

router = routers.DefaultRouter()

#App Película
router.register('peliculas',PeliculaViewset)
router.register('funciones',FuncionViewset)
router.register('salas',SalaViewset)
router.register('asientos',AsientoViewset)
router.register('reservarAsientos',ReservarAsientoViewset)

#App Combos
router.register('combos',ComboViewset)
router.register('entradas',EntradaViewset)

#App Factura
router.register('facturas',FacturaViewset)
router.register('facturas',ComprasCombosViewset)