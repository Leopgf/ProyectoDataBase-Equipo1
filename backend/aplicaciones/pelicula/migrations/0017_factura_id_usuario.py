# Generated by Django 3.0.6 on 2020-06-03 03:21

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('pelicula', '0016_auto_20200602_2309'),
    ]

    operations = [
        migrations.AddField(
            model_name='factura',
            name='id_usuario',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='pelicula.Usuarios'),
            preserve_default=False,
        ),
    ]