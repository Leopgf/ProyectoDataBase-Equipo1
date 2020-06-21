# Generated by Django 3.0.6 on 2020-06-21 06:13

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('pelicula', '0021_pelicula'),
    ]

    operations = [
        migrations.CreateModel(
            name='Categoria',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('categoria', models.CharField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='registroCategorias',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('id_categoria', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='pelicula.Categoria')),
                ('id_pelicula', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='pelicula.Pelicula')),
            ],
        ),
    ]
