from rest_framework import viewsets
from . import models
from . import serializers

class PeliculaViewset(viewsets.ModelViewSet):
    queryset = models.Pelicula.objects.all()
    serializer_class = serializers.PeliculasSerializer