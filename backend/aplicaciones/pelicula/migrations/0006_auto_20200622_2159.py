# Generated by Django 3.0.6 on 2020-06-23 01:59

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('pelicula', '0005_factura_puntos_usados'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='usuario',
            name='contrasena',
        ),
        migrations.RemoveField(
            model_name='usuario',
            name='estado',
        ),
    ]