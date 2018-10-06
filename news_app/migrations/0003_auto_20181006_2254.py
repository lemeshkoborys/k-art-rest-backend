# Generated by Django 2.1.2 on 2018-10-06 22:54

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('news_app', '0002_auto_20181005_2110'),
    ]

    operations = [
        migrations.CreateModel(
            name='Comment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('author', models.CharField(max_length=120, verbose_name='Автор комментария')),
                ('email', models.EmailField(max_length=254, verbose_name='Почта автора')),
                ('created', models.DateTimeField(auto_now_add=True, verbose_name='Создан')),
            ],
            options={
                'verbose_name': 'комментарий',
                'verbose_name_plural': 'комментарии',
                'db_table': 'comments',
            },
        ),
        migrations.AddField(
            model_name='post',
            name='content',
            field=models.TextField(default=django.utils.timezone.now, verbose_name='Текст новости'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='post',
            name='created',
            field=models.DateTimeField(auto_now_add=True, default=django.utils.timezone.now, verbose_name=' Создано'),
            preserve_default=False,
        ),
    ]
