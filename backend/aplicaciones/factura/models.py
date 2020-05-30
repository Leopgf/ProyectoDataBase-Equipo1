from django.db import models
from aplicaciones.pelicula.models import Funcion, Asiento
from aplicaciones.combos.models import Combo, Entrada


#Factura
class Factura(models.Model):
    fecha_compra = models.DateField()
    #id_funcion = models.ForeignKey('Funcion', on_delete=models.CASCADE)

    class Meta:
        ordering = ['fecha_compra']
        verbose_name = 'Factura'
        verbose_name_plural = 'Facturas'

#ComprasCombos
class ComprasCombos(models.Model):
    cantidad = models.IntegerField()
    #id_factura = models.ForeignKey('Factura', on_delete=models.CASCADE)
    #id_combos = models.ForeignKey('Combo', on_delete=models.CASCADE)

    class Meta:
        ordering = ['cantidad']
        verbose_name = 'Compras Combos'
        verbose_name_plural = 'Compras Combos'

#ComprasEntradas
#class ComprasEntradas(models.Model):
    #id_factura = models.ForeignKey('Factura', on_delete=models.CASCADE)
    #id_entrada = models.ForeignKey('Entrada', on_delete=models.CASCADE)
    #id_asiento = models.ForeignKey('Asiento', on_delete=models.CASCADE)