from rest_framework import serializers
from .models import Pelicula

class PeliculasSerializer(serializers.ModelSerializer):
    class Meta:
        model = Pelicula
        fields = '__all__'