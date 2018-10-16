from django.urls import path
from .views import render_500

urlpatterns = [
    path('500/', render_500, name='serverError')
]