from django.contrib import admin

# Register your models here.
from .models import Pelicula, Funcion, Sala, Asiento, ReservarAsientos, Entrada

admin.site.register(Pelicula)
admin.site.register(Funcion)
admin.site.register(Sala)
admin.site.register(Asiento)
admin.site.register(ReservarAsientos)
admin.site.register(Entrada)
