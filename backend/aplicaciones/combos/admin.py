from django.contrib import admin

# Register your models here.
from .models import Combo, Entrada

admin.site.register(Combo)
admin.site.register(Entrada)