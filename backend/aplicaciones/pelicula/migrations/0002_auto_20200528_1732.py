# Generated by Django 3.0.6 on 2020-05-28 21:32

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('pelicula', '0001_initial'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='Peliculas',
            new_name='Pelicula',
        ),
        migrations.AlterModelOptions(
            name='pelicula',
            options={'ordering': ['titulo'], 'verbose_name': 'Pelicula', 'verbose_name_plural': 'Peliculas'},
        ),
    ]