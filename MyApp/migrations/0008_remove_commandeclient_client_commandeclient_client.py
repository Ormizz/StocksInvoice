# Generated by Django 4.1.7 on 2023-09-08 15:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('MyApp', '0007_commandeclient_lignecommandeclient_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='commandeclient',
            name='Client',
        ),
        migrations.AddField(
            model_name='commandeclient',
            name='client',
            field=models.CharField(default='', max_length=20),
        ),
    ]