# Generated by Django 3.0.6 on 2020-05-30 20:32

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('combos', '0004_auto_20200530_1632'),
        ('pelicula', '0008_auto_20200530_1632'),
        ('factura', '0002_auto_20200530_0425'),
    ]

    operations = [
        migrations.AddField(
            model_name='comprascombos',
            name='id_combos',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='combos.Combo'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='comprascombos',
            name='id_factura',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='factura.Factura'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='factura',
            name='id_funcion',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='pelicula.Funcion'),
            preserve_default=False,
        ),
        migrations.CreateModel(
            name='ComprasEntradas',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('id_asiento', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='pelicula.Asiento')),
                ('id_entrada', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='pelicula.Entrada')),
                ('id_factura', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='factura.Factura')),
            ],
        ),
    ]