from django.contrib import admin
from .models import Feedback, FeedbackCategory


class FeedbackModelAdmin(admin.ModelAdmin):

    list_display = (
        'category',
        'name',
        'email',
        'content'
    )


admin.site.register(Feedback, FeedbackModelAdmin)
admin.site.register(FeedbackCategory)
