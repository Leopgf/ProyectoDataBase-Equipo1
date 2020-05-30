# Generated by Django 3.0.6 on 2020-05-30 20:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pelicula', '0007_auto_20200530_0422'),
    ]

    operations = [
        migrations.CreateModel(
            name='Entrada',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tipo', models.CharField(max_length=20)),
                ('precio', models.FloatField()),
            ],
            options={
                'verbose_name': 'Entrada',
                'verbose_name_plural': 'Entradas',
                'ordering': ['tipo'],
            },
        ),
        migrations.AlterModelOptions(
            name='asiento',
            options={'ordering': ['id_sala'], 'verbose_name': 'Asiento', 'verbose_name_plural': 'Asientos'},
        ),
        migrations.AlterModelOptions(
            name='reservarasientos',
            options={'ordering': ['id_funcion'], 'verbose_name': 'Reservación de Asiento', 'verbose_name_plural': 'Reservación Asientos'},
        ),
    ]