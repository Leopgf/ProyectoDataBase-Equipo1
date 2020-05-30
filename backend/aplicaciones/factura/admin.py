from django.contrib import admin

# Register your models here.
from .models import Factura, ComprasCombos, ComprasEntradas

admin.site.register(Factura)
admin.site.register(ComprasCombos)
admin.site.register(ComprasEntradas)