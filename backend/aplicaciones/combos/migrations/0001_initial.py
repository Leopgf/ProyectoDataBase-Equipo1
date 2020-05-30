# Generated by Django 3.0.6 on 2020-05-30 02:54

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Combo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=200)),
                ('descripcion', models.TextField()),
                ('precio', models.DecimalField(decimal_places=2, max_digits=4)),
                ('estado', models.BooleanField()),
            ],
        ),
        migrations.CreateModel(
            name='Entrada',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tipo', models.CharField(max_length=200)),
                ('precio', models.DecimalField(decimal_places=2, max_digits=4)),
            ],
        ),
        migrations.CreateModel(
            name='Pelicula',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('titulo', models.CharField(max_length=200)),
                ('sinopsis', models.TextField()),
                ('categoria', models.CharField(max_length=100)),
                ('imagen', models.CharField(max_length=200)),
                ('fecha_estreno', models.DateField()),
                ('fecha_salida', models.DateField()),
                ('duracion', models.TimeField()),
                ('estado', models.BooleanField()),
            ],
            options={
                'verbose_name': 'Pelicula',
                'verbose_name_plural': 'Peliculas',
                'ordering': ['titulo'],
            },
        ),
    ]
