from django.db import models
from cloudinary.models import CloudinaryField 


class SectionImage(models.Model):

    class Meta:
        db_table = 'section_images'
        verbose_name = 'Картинка'
        verbose_name_plural = 'Картинки'

    section = models.ForeignKey(
        'index_app.Section',
        on_delete=models.CASCADE,
        verbose_name='Секция'
    )

    image = CloudinaryField('Картинка')

    def __str__(self):
        return str(self.image)


class Section(models.Model):

    class Meta:
        db_table = 'sections'
        verbose_name = 'Секция'
        verbose_name_plural = 'Секции'

    category = models.ForeignKey(
        'index_app.Category',
        on_delete=models.CASCADE,
        verbose_name='Раздел',
        null=True,
        default=None
    )

    title = models.CharField(
        max_length=120,
        null=False,
        blank=False,
        verbose_name='Название'
    )

    description = models.TextField(
        blank=False,
        null=False,
        verbose_name='Описание'
    )

    def get_images_links(self):
        images = SectionImage.objects.filter(section=self)
        print(images)
        return [('hallo' + str(x.image)) for x in images]

    def __str__(self):
        return self.title


class Category(models.Model):

    class Meta:
        db_table = 'categories'
        verbose_name = 'Основной Раздел'
        verbose_name_plural = 'Основные Разделы'

    title = models.CharField(
        max_length=120,
        blank=False,
        null=False,
        verbose_name='Название раздела'
    )

    @property
    def get_sections(self):
        return Section.objects.filter(category=self)

    def get_sections_titles(self):
        sections = Section.objects.filter(category=self)
        return [x.title for x in sections]

    get_sections_titles.short_description = 'Секции'

    def __str__(self):
        return self.title
    