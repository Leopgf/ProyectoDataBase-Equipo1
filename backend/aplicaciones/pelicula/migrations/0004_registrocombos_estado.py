# Generated by Django 3.0.6 on 2020-06-21 22:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pelicula', '0003_categoria_estado'),
    ]

    operations = [
        migrations.AddField(
            model_name='registrocombos',
            name='estado',
            field=models.BooleanField(default=True),
        ),
    ]