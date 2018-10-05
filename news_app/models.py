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

    image = CloudinaryField()


@receiver(pre_delete, sender=Post)
def photo_delete(sender, instance, **kwargs):
    destroy(instance.image.public_id)
