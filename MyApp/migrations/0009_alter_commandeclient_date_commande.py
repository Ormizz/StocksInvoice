# Generated by Django 4.1.7 on 2023-09-08 15:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('MyApp', '0008_remove_commandeclient_client_commandeclient_client'),
    ]

    operations = [
        migrations.AlterField(
            model_name='commandeclient',
            name='date_commande',
            field=models.DateField(),
        ),
    ]