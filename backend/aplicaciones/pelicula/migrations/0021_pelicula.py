# Generated by Django 3.0.6 on 2020-06-21 06:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pelicula', '0020_usuario'),
    ]

    operations = [
        migrations.CreateModel(
            name='Pelicula',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('titulo', models.CharField(max_length=200)),
                ('sinopsis', models.TextField()),
                ('imagen', models.CharField(max_length=200)),
                ('fecha_estreno', models.DateField()),
                ('fecha_salida', models.DateField()),
                ('duracion', models.TimeField()),
                ('estado', models.BooleanField(default=True)),
            ],
            options={
                'verbose_name': 'Pelicula',
                'verbose_name_plural': 'Peliculas',
                'ordering': ['titulo'],
            },
        ),
    ]
