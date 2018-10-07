from django.db import models
from cloudinary.models import CloudinaryField as BaseCloudinaryField
from cloudinary.uploader import destroy
from django.db.models.signals import pre_delete
from django.dispatch import receiver


class CloudinaryField(BaseCloudinaryField):
    def upload_options(self, model_instance):
        return {
            'folder': 'k-art-site-news-photos/'
        }


class Post(models.Model):

    class Meta:
        db_table = 'posts'
        verbose_name = 'Новость'
        verbose_name_plural = 'Новости'

    title = models.CharField(
        max_length=350,
        null=False,
        blank=False,
        verbose_name='Заголовок'
    )

    content = models.TextField(
        null=False,
        blank=False,
        verbose_name='Текст новости'
    )

    created = models.DateTimeField(
        auto_now_add=True,
        verbose_name=' Создано'
    )

    image = CloudinaryField()

    def __str__(self):
        return self.title


@receiver(pre_delete, sender=Post)
def photo_delete(sender, instance, **kwargs):
    destroy(instance.image.public_id)


class Comment(models.Model):

    class Meta:
        db_table = 'comments'
        verbose_name = 'комментарий'
        verbose_name_plural = 'комментарии'

    post = models.ForeignKey(
        Post,
        on_delete=models.CASCADE,
        related_name='comments'
    )

    author = models.CharField(
        max_length=120,
        null=False,
        blank=False,
        verbose_name='Автор комментария'
    )

    email = models.EmailField(
        null=False,
        blank=False,
        verbose_name='Почта автора'
    )

    created = models.DateTimeField(
        auto_now_add=True,
        verbose_name='Создан'
    )

    content = models.TextField(
        null=False,
        blank=False,
        verbose_name='Текст новости'
    )

    def __str__(self):
        return 'Title: ' + self.post.title + '; Author: ' + self.author + '; Created at: ' + str(self.created)
