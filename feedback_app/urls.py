from django.urls import path
from .views import FeedbackCreate, feedback_render

urlpatterns = [
    path('', feedback_render, name='feedback'),
    path('create/', FeedbackCreate.as_view(), name='feedback-create')
]