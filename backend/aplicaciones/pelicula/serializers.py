from rest_framework import serializers
from .models import Pelicula, Funcion, Sala, Asiento, ReservarAsientos, Entrada, Factura, ComprasCombos, ComprasEntradas, Combo

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

class EntradasSerializer(serializers.ModelSerializer):
    class Meta:
        model = Entrada
        fields = '__all__'




class FacturaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Factura
        fields = '__all__'


class ComprasCompbosSerializer(serializers.ModelSerializer):
    class Meta:
        model = ComprasCombos
        fields = '__all__'


class ComprasEntradasSerializer(serializers.ModelSerializer):
    class Meta:
        model = ComprasEntradas
        fields = '__all__'




class CombosSerializer(serializers.ModelSerializer):
    class Meta:
        model = Combo
        fields = '__all__'


# class UsuariosSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Usuario
#         fields = '__all__'