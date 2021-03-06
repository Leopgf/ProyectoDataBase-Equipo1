# Generated by Django 3.0.6 on 2020-07-06 21:29

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('pelicula', '0012_auto_20200705_2048'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='usuario',
            options={'verbose_name': 'Usuario', 'verbose_name_plural': 'Usuarios'},
        ),
        migrations.AlterField(
            model_name='producto',
            name='id_tipos_productos',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='pelicula.TipoProductos'),
        ),
    ]
