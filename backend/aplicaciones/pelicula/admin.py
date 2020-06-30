from django.contrib import admin


from .models import Usuario, Pelicula, Categoria, registroCategorias, Alimento, Entrada, ComboCine, Cliente, Empleado, Sucursal, Sala, Funcion, Asiento, tipoProductos, Producto, registroCombos, Factura, Promociones, registroPromociones, registroCompras, registroAsientosReservados

admin.site.register(Usuario)
admin.site.register(Pelicula)
admin.site.register(Categoria)
admin.site.register(registroCategorias)
admin.site.register(Sucursal)
admin.site.register(Sala)
admin.site.register(Funcion)
admin.site.register(Asiento)
admin.site.register(tipoProductos)
admin.site.register(Producto)
admin.site.register(registroCombos)
admin.site.register(Factura)
admin.site.register(Promociones)
admin.site.register(registroPromociones)
admin.site.register(registroCompras)
admin.site.register(registroAsientosReservados)
admin.site.register(Alimento)
admin.site.register(Entrada)
admin.site.register(ComboCine)
admin.site.register(Cliente)
admin.site.register(Empleado)
