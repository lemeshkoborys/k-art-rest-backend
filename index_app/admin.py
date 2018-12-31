from django.contrib import admin
from .models import Section, SectionImage, Category
from django.urls import reverse
from django.utils.html import mark_safe


@admin.register(Section)
class SectionModelAdmin(admin.ModelAdmin):

    list_display = (
        'title',
        'description',
        'get_images_links'
    )

    list_filter = (
        'category',
    )


@admin.register(SectionImage)
class SectionImageModelAdmin(admin.ModelAdmin):

    list_display = (
        'section',
        'image',
    )

    list_filter = (
        'section',
    )


@admin.register(Category)
class CategoryModelAdmin(admin.ModelAdmin):

    def items_display(self, obj):
        display_text = "".join([
            "<a href={}>{}</a>,<br/>".format(
                    reverse('admin:{}_{}_change'.format(child._meta.app_label, child._meta.model_name),
                    args=(child.pk,)),
                child.title)
             for child in obj.get_sections
        ])
        if display_text:
            return mark_safe(display_text)
        return "-"

    list_display = (
        'title',
        'items_display'
    )
