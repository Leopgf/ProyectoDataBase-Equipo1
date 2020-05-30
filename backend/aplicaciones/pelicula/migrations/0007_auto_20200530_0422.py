# Generated by Django 3.0.6 on 2020-05-30 04:22

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('pelicula', '0006_auto_20200530_0420'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='asiento',
            options={'ordering': ['fila'], 'verbose_name': 'Asiento', 'verbose_name_plural': 'Asientos'},
        ),
        migrations.AlterModelOptions(
            name='funcion',
            options={'ordering': ['fecha'], 'verbose_name': 'Funcion', 'verbose_name_plural': 'Funciones'},
        ),
        migrations.AlterModelOptions(
            name='pelicula',
            options={'ordering': ['titulo'], 'verbose_name': 'Pelicula', 'verbose_name_plural': 'Peliculas'},
        ),
        migrations.AlterModelOptions(
            name='reservarasientos',
            options={'ordering': ['estado'], 'verbose_name': 'Reservar Asiento', 'verbose_name_plural': 'Reservar Asientos'},
        ),
        migrations.AlterModelOptions(
            name='sala',
            options={'ordering': ['tipo_sala'], 'verbose_name': 'Sala', 'verbose_name_plural': 'Salas'},
        ),
    ]
