from aplicaciones.pelicula.viewsets import PeliculaViewset, FuncionViewset, SalaViewset, AsientoViewset, ReservarAsientoViewset, EntradaViewset
from aplicaciones.combos.viewsets import ComboViewset
from aplicaciones.factura.viewsets import FacturaViewset, ComprasCombosViewset

from rest_framework import routers

router = routers.DefaultRouter()

#App Película
router.register('peliculas',PeliculaViewset)
router.register('funciones',FuncionViewset)
router.register('salas',SalaViewset)
router.register('asientos',AsientoViewset)
router.register('reservarAsientos',ReservarAsientoViewset)
router.register('entradas',EntradaViewset)

#App Combos
router.register('combos',ComboViewset)

#App Factura
router.register('facturas',FacturaViewset)
router.register('facturas',ComprasCombosViewset)