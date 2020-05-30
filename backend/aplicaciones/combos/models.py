from django.db import models

#Combo
class Combo(models.Model):
    nombre = models.CharField(max_length=200)
    descripcion = models.TextField()
    precio = models.FloatField()
    estado = models.BooleanField()

    def __str__(self):
        return self.nombre

    class Meta:
        ordering = ['nombre']
        verbose_name = 'Combo'
        verbose_name_plural = 'Combos'
