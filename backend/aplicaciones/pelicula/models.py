from django.db import models


#Usuarios
class Usuario(models.Model):
    cedula = models.CharField(max_length=15, unique=True)
    nombre = models.CharField(max_length=100)
    apellido = models.CharField(max_length=100)

    def __str__(self):
        return self.nombre

    class Meta:
        ordering = ['nombre']
        verbose_name = 'Usuario'
        verbose_name_plural = 'Usuarios'  


#Sucursal
class Sucursal(models.Model):
    nombre = models.CharField(max_length=200, unique=True)
    ubicacion = models.CharField(max_length=200)

    def __str__(self):
        return self.nombre

    class Meta:
        ordering = ['nombre']
        verbose_name = 'Sucursal'
        verbose_name_plural = 'Sucursales'  


#Empleado
class Empleado(models.Model):
    id_usuario = models.ForeignKey(Usuario, on_delete=models.CASCADE)
    id_sucursal = models.ForeignKey(Sucursal, on_delete=models.CASCADE)
    tiene_permisos = models.BooleanField(default=False)

    class Meta:
        verbose_name = 'Empleado'


#Clientes
class Cliente(models.Model):
    id_usuario = models.ForeignKey(Usuario, on_delete=models.CASCADE)
    puntos = models.IntegerField(default=0)

    def __str__(self):
        return self.nombre

    class Meta:
        ordering = ['puntos']
        verbose_name = 'Cliente'
        verbose_name_plural = 'Cliente'  


#Pelicula
class Pelicula(models.Model):
    titulo = models.CharField(max_length=200)
    sinopsis = models.TextField()
    imagen = models.CharField(max_length=200)
    fecha_estreno = models.DateField()
    fecha_salida = models.DateField()
    duracion = models.TimeField()
    estado = models.BooleanField(default=True)

    def __str__(self):
        return self.titulo

    class Meta:
        ordering = ['titulo']
        verbose_name = 'Pelicula'
        verbose_name_plural = 'Peliculas'


#Categorias
class Categoria(models.Model):
    categoria = models.CharField(max_length=200, unique=True)
    estado = models.BooleanField(default=True)

    def __str__(self):
        return self.categoria

    class Meta:
        ordering = ['categoria']
        verbose_name = 'Categoria'
        verbose_name_plural = 'Categorias'  


#Registro Categorias
class registroCategorias(models.Model):
    id_pelicula = models.ForeignKey(Pelicula, on_delete=models.CASCADE)
    id_categoria = models.ForeignKey(Categoria, on_delete=models.CASCADE)

    class Meta:
        verbose_name = 'Reistro Categoria'
        verbose_name_plural = 'Registro Categorias'  


#Sala
class Sala(models.Model):
    nombre = models.CharField(max_length=200)
    numero_filas = models.IntegerField()
    numero_columnas = models.IntegerField()
    id_sucursal = models.ForeignKey(Sucursal, on_delete=models.CASCADE)

    def __str__(self):
        return self.nombre

    class Meta:
        ordering = ['nombre']
        verbose_name = 'Sala'
        verbose_name_plural = 'Salas'


#Funcion
class Funcion(models.Model):
    fecha = models.DateField()
    hora = models.TimeField()
    butacas_disponibles = models.IntegerField()
    estado = models.BooleanField(default=True)
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


#TipoProductos
class tipoProductos(models.Model):
    tipo = models.CharField(max_length=200)

    def __str__(self):
        return self.tipo

    class Meta:
        ordering = ['tipo']
        verbose_name = 'Tipo Producto'
        verbose_name_plural = 'Tipo Productos'

#Productos
class Producto(models.Model):
    id_tipos_productos = models.ForeignKey(tipoProductos, on_delete=models.CASCADE)
    nombre = models.CharField(max_length=200, unique=True)
    precio = models.FloatField()
    estado = models.BooleanField(default=True)

    def __str__(self):
        return self.nombre

    class Meta:
        ordering = ['nombre']
        verbose_name = 'Producto'
        verbose_name_plural = 'Productos'


#RegistroCombos
class registroCombos(models.Model):
    id_producto_combo = models.ForeignKey(Producto, on_delete=models.CASCADE, related_name='combo')
    id_producto = models.ForeignKey(Producto, on_delete=models.CASCADE, related_name='producto')
    cantidad = models.IntegerField()
     
    class Meta:
        verbose_name = 'Registro Combo'
        verbose_name_plural = 'Registro Combos'

#Factura
class Factura(models.Model):
    fecha_compra = models.DateField(auto_now_add=True, auto_now=False)
    id_usuario = models.ForeignKey(Usuario, on_delete=models.CASCADE)
    total_factura = models.FloatField(default=0)
    puntos_usados = models.IntegerField(default=0)

    class Meta:
        ordering = ['fecha_compra']
        verbose_name = 'Factura'
        verbose_name_plural = 'Facturas'


#Promociones
class Promociones(models.Model):
    nombre = models.CharField(max_length=200, unique=True)
    descripcion = models.TextField()
    descuento = models.FloatField()
    fecha_inicio = models.DateField(auto_now=True)
    fecha_fin = models.DateField(auto_now=True)
    estado = models.BooleanField(default=True)

    def __str__(self):
        return self.nombre

    class Meta:
        ordering = ['nombre']
        verbose_name = 'Promocion'
        verbose_name_plural = 'Promociones'


#RegistroPromociones
class registroPromociones(models.Model):
    id_factura = models.ForeignKey(Factura, on_delete=models.CASCADE)
    id_promociones = models.ForeignKey(Promociones, on_delete=models.CASCADE)
    descuento_aplicado = models.FloatField()

    class Meta:
        verbose_name = 'Registro Promoción'
        verbose_name_plural = 'Registros Promociones'


#RegistroCompras
class registroCompras(models.Model):
    id_factura = models.ForeignKey(Factura, on_delete=models.CASCADE)
    id_producto = models.ForeignKey(Producto, on_delete=models.CASCADE)
    cantidad = models.IntegerField()
    precio = models.FloatField()

    class Meta:
        verbose_name = 'Registro Compra'
        verbose_name_plural = 'Registros Compras'


#RegistroAsientosReservados
class registroAsientosReservados(models.Model):
    id_factura = models.ForeignKey(Factura, on_delete=models.CASCADE)
    id_asientos = models.ForeignKey(Asiento, on_delete=models.CASCADE)
    id_funciones = models.ForeignKey(Funcion, on_delete=models.CASCADE)

    class Meta:
        verbose_name = 'Registro Asiento Reservado'
        verbose_name_plural = 'Registros Asientos Reservados'
    

#Combos
class ComboCine(models.Model):
    id_producto = models.ForeignKey(Producto, on_delete=models.CASCADE)
    descripcion = models.TextField()
    descuento = models.FloatField()

    def __str__(self):
        return self.descripcion

    class Meta:
        verbose_name = 'Combo Cine'
        verbose_name_plural = 'Combos Cine'


#Alimento
class Alimento(models.Model):
    id_producto = models.ForeignKey(Producto, on_delete=models.CASCADE)
    contenido_neto = models.CharField(max_length=100)

    def __str__(self):
        return self.contenido_neto

    class Meta:
        verbose_name = 'Alimento'
        verbose_name_plural = 'Alimentos'


#Entrada
class Entrada(models.Model):
    id_producto = models.ForeignKey(Producto, on_delete=models.CASCADE)
    tipo = models.CharField(max_length=100)

    def __str__(self):
        return self.tipo

    class Meta:
        ordering = ['tipo']
        verbose_name = 'Entrada'
        verbose_name_plural = 'Entradas'