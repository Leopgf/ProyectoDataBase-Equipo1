# Generated by Django 3.0.6 on 2020-05-30 02:37

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('pelicula', '0003_auto_20200530_0229'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='ReservaAsientos',
            new_name='ReservarAsientos',
        ),
    ]