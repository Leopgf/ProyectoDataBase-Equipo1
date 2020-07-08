"""backend URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.conf.urls import url
from aplicaciones.pelicula.viewsets import RegistroCategoriaViewset, FuncionPorPeliculaViewset, FuncionOcupadaViewset, RegistroCombosViewset, UsuarioViewset, IdUsuarioEmpleadoViewset, IdUsuarioClienteViewset, IniciarSesionEmpleadoViewset, IniciarSesionClienteViewset
from .router import router

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(router.urls)),

    # RUTA PARA TRAER LAS CATEGORIAS DE UNA PELÍCULA
    url('^api/registroCategorias/(?P<id_pelicula>.+)/$', RegistroCategoriaViewset.as_view(),name="categoriasUnaPeli"),

    # RUTA PARA TRAER LAS FUNCIONES DE UNA PELÍCULA
    url('^api/funciones-pelicula/(?P<id_pelicula>.+)/$', FuncionPorPeliculaViewset.as_view(),name="funcionesPorPeli"),

    # RUTA PARA VALIDAR QUE NO EXISTA OTRA FUNCIÓN EN ESE MOMENTO
    url('^api/agregar-funcion/(?P<id_sala>.+)/(?P<fecha>.+)/(?P<hora>.+)/$', FuncionOcupadaViewset.as_view(),name="funcionesPorPeli"),

    # RUTA PARA TRAER LOS PRODUCTOS DE UN COMBO
    url('^api/registroCombos/(?P<id_producto_combo>.+)/$', RegistroCombosViewset.as_view(), name ="registroCombos"),

    # RUTA PARA TRAER UN USUARIO/CLIENTE/EMPLEADO POR SU CEDULA
    url('^api/usuario/(?P<cedula>.+)/$', UsuarioViewset.as_view(), name ="usuario"),
    url('^api/iniciar-sesion-empleado/(?P<cedula>.+)/$', IniciarSesionEmpleadoViewset.as_view(), name ="iniciar-sesion-empleado" ),
    url('^api/iniciar-sesion-cliente/(?P<cedula>.+)/$', IniciarSesionClienteViewset.as_view(), name ="inicir-sesion-cliente" ),

    # RUTA PARA TRAER UN EMPLEADO POR EL ID DEL USUARIO
    url('^api/permisos-empleado/(?P<id_usuario>.+)/$', IdUsuarioEmpleadoViewset.as_view(), name ="permisos-empleado" ),
    url('^api/cliente/(?P<id_usuario>.+)/$', IdUsuarioClienteViewset.as_view(), name ="cliente" ),
]
