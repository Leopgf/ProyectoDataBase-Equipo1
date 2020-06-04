# Generated by Django 3.0.6 on 2020-06-03 03:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pelicula', '0017_factura_id_usuario'),
    ]

    operations = [
        migrations.AlterField(
            model_name='factura',
            name='fecha_compra',
            field=models.DateField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='pelicula',
            name='categoria',
            field=models.CharField(choices=[('Acción', 'Acción'), ('Animación', 'Animación'), ('Aventura', 'Aventura'), ('Ciencia Ficción', 'Ciencia Ficción'), ('Comedia', 'Comedia'), ('Drama', 'Drama'), ('Romance', 'Romance'), ('Terror', 'Terror')], max_length=100),
        ),
    ]