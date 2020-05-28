from aplicaciones.pelicula.viewsets import PeliculaViewset
from rest_framework import routers

router = routers.DefaultRouter()
router.register('peliculas',PeliculaViewset)