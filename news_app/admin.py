from django.contrib import admin
from .models import Post


class PostModelAdmin(admin.ModelAdmin):

    list_display = (
        'title',
        'short_content',
        'created'
    )


admin.site.register(Post, PostModelAdmin)

