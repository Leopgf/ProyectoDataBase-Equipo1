from django.db import models

# Create your models here.



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


#Pelicula
class Pelicula(models.Model):
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

#Sala
class Sala(models.Model):
    tipo_sala = models.CharField(max_length=200)
    numero_filas = models.IntegerField()
    numero_columnas = models.IntegerField()
    imagen = models.CharField(max_length=200)

    def __str__(self):
        return self.tipo_sala

    class Meta:
        ordering = ['tipo_sala']
        verbose_name = 'Sala'
        verbose_name_plural = 'Salas'

#Funcion
class Funcion(models.Model):
    fecha = models.DateField()
    hora = models.TimeField()
    butacas_disponibles = models.IntegerField()
    estado = models.BooleanField()
    id_pelicula = models.ForeignKey(Pelicula, on_delete=models.CASCADE)
    id_sala = models.ForeignKey(Sala, on_delete=models.CASCADE)

    class Meta:
        ordering = ['fecha']
        verbose_name = 'Funcion'
        verbose_name_plural = 'Funciones'

#Asiento
class Asiento(models.Model):
    fila = models.IntegerField()
    columna = models.IntegerField()
    id_sala = models.ForeignKey(Sala, on_delete=models.CASCADE)

    class Meta:
        ordering = ['id_sala']
        verbose_name = 'Asiento'
        verbose_name_plural = 'Asientos'

#ReservaAsientos
class ReservarAsientos(models.Model):
    estado = models.BooleanField()
    id_asiento = models.ForeignKey(Asiento, on_delete=models.CASCADE)
    id_funcion = models.ForeignKey(Funcion, on_delete=models.CASCADE)

    class Meta:
        ordering = ['id_funcion']
        verbose_name = 'Reservación de Asiento'
        verbose_name_plural = 'Reservación Asientos'

#Entrada
class Entrada(models.Model):
    tipo = models.CharField(max_length=20)
    precio = models.FloatField()

    def __str__(self):
        return self.tipo

    class Meta:
        ordering = ['tipo']
        verbose_name = 'Entrada'
        verbose_name_plural = 'Entradas'




#Factura
class Factura(models.Model):
    fecha_compra = models.DateField()
    id_funcion = models.ForeignKey(Funcion, on_delete=models.CASCADE)

    class Meta:
        ordering = ['fecha_compra']
        verbose_name = 'Factura'
        verbose_name_plural = 'Facturas'

#ComprasCombos
class ComprasCombos(models.Model):
    cantidad = models.IntegerField()
    id_factura = models.ForeignKey(Factura, on_delete=models.CASCADE)
    id_combos = models.ForeignKey(Combo, on_delete=models.CASCADE)

    class Meta:
        ordering = ['cantidad']
        verbose_name = 'Compras Combos'
        verbose_name_plural = 'Compras Combos'


#ComprasEntradas
class ComprasEntradas(models.Model):
    id_factura = models.ForeignKey(Factura, on_delete=models.CASCADE)
    id_entrada = models.ForeignKey(Entrada, on_delete=models.CASCADE)
    id_asiento = models.ForeignKey(Asiento, on_delete=models.CASCADE)


#Usuario
# class Usuario(models.Model):
#     nombre = models.CharField(max_length=200)
#     apellido = models.CharField(max_length=200)
#     contrasena = models.CharField(max_length=20)
#     cedula = models.IntegerField()
#     puntos = models.IntegerField()
#     estado = models.BooleanField()

#     def __str__(self):
#         return self.nombre

#     class Meta:
#         ordering = ['nombre']
#         verbose_name = 'Usuario'
#         verbose_name_plural = 'Usuarios'

