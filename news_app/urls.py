from django.urls import path
from .views import PostList, api_root, post_list_view

urlpatterns = [
    path('api-root', api_root, name='api-root'),
    path('posts/', PostList.as_view(), name='post-list'),
    path('', post_list_view)
]