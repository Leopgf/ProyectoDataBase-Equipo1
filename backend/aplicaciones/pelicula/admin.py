from django.contrib import admin


from .models import Usuario, Pelicula, Categoria, RegistroCategorias, Alimento, Entrada, ComboCine, Cliente, Empleado, Sucursal, Sala, Funcion, Asiento, TipoProductos, Producto, RegistroCombos, Factura, Promociones, RegistroPromociones, RegistroCompras, RegistroAsientosReservados

admin.site.register(Usuario)
admin.site.register(Pelicula)
admin.site.register(Categoria)
admin.site.register(RegistroCategorias)
admin.site.register(Sucursal)
admin.site.register(Sala)
admin.site.register(Funcion)
admin.site.register(Asiento)
admin.site.register(TipoProductos)
admin.site.register(Producto)
admin.site.register(RegistroCombos)
admin.site.register(Factura)
admin.site.register(Promociones)
admin.site.register(RegistroPromociones)
admin.site.register(RegistroCompras)
admin.site.register(RegistroAsientosReservados)
admin.site.register(Alimento)
admin.site.register(Entrada)
admin.site.register(ComboCine)
admin.site.register(Cliente)
admin.site.register(Empleado)