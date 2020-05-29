from django.db import models

# Create your models here.
class Pelicula (models.Model):
    titulo = models.CharField(max_length=200)
    sinopsis = models.TextField()
    categoria = models.CharField(max_length=100)
    imagen = models.CharField(max_length=200)
    fecha_estreno = models.DateField()
    fecha_salida = models.DateField()
    duracion = models.TimeField()
    estado = models.BooleanField()

    def __str__(self):
        return self.titulo

    class Meta:
        ordering = ['titulo']
        verbose_name = 'Pelicula'
        verbose_name_plural = 'Peliculas'
