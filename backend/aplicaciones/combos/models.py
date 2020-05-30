from django.db import models


#Combo
class Combo(models.Model):
    nombre = models.CharField(max_length=200)
    descripcion = models.TextField()
    precio = models.DecimalField(decimal_places=2, max_digits=4)
    estado = models.BooleanField()

    def __str__(self):
        return self.nombre

    class Meta:
        ordering = ['nombre']
        verbose_name = 'Combo'
        verbose_name_plural = 'Combos'

#Entrada
class Entrada(models.Model):
    tipo = models.CharField(max_length=200)
    precio = models.DecimalField(decimal_places=2, max_digits=4)

    def __str__(self):
        return self.tipo

    class Meta:
        ordering = ['tipo']
        verbose_name = 'Entrada'
        verbose_name_plural = 'Entradas'