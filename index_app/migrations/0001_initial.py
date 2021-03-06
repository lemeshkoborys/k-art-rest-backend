# Generated by Django 2.1.4 on 2018-12-30 22:46

import cloudinary.models
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Section',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=120, verbose_name='Название')),
                ('description', models.TextField(verbose_name='Описание')),
            ],
            options={
                'verbose_name': 'Секция',
                'verbose_name_plural': 'Секции',
                'db_table': 'sections',
            },
        ),
        migrations.CreateModel(
            name='SectionImage',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', cloudinary.models.CloudinaryField(max_length=255, verbose_name='Картинка')),
                ('section', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='index_app.Section', verbose_name='Секция')),
            ],
            options={
                'verbose_name': 'Картинка',
                'verbose_name_plural': 'Картинки',
                'db_table': 'section_images',
            },
        ),
    ]
