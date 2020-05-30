from rest_framework import serializers
from .models import Pelicula, Funcion, Sala, Asiento, ReservarAsientos

class PeliculasSerializer(serializers.ModelSerializer):
    class Meta:
        model = Pelicula
        fields = '__all__'

class FuncionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Funcion
        fields = '__all__'

class SalaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Sala
        fields = '__all__'

class AsientoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Asiento
        fields = '__all__'

class ReservarAsientoSerializer(serializers.ModelSerializer):
    class Meta:
        model = ReservarAsientos
        fields = '__all__'