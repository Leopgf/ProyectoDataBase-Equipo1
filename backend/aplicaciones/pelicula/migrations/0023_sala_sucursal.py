# Generated by Django 3.0.6 on 2020-06-21 06:14

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('pelicula', '0022_categoria_registrocategorias'),
    ]

    operations = [
        migrations.CreateModel(
            name='Sucursal',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=200)),
                ('ubicacion', models.CharField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='Sala',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=200)),
                ('numero_filas', models.IntegerField()),
                ('numero_columnas', models.IntegerField()),
                ('id_sucursal', models.ForeignKey(default=0, on_delete=django.db.models.deletion.CASCADE, to='pelicula.Sucursal')),
            ],
            options={
                'verbose_name': 'Sala',
                'verbose_name_plural': 'Salas',
                'ordering': ['nombre'],
            },
        ),
    ]
