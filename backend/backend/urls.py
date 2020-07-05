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
from aplicaciones.pelicula.viewsets import registroCategoriaViewset, registroCombosViewset, UsuarioViewset
from .router import router

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(router.urls)),
    url('^api/registroCategorias/(?P<id_pelicula>.+)/$', registroCategoriaViewset.as_view(),name="registroCategorias"),
    url('^api/registroCombos/(?P<id_producto_combo>.+)/$', registroCombosViewset.as_view(), name ="registroCombos" ),
    url('^api/iniciarSesion/(?P<cedula>.+)/$', UsuarioViewset.as_view(), name ="iniciarSesion" ),
    
]
