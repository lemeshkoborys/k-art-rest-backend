from django.urls import path
from .views import PostList, api_root, post_list_view, CommentCreate, CommentList

urlpatterns = [
    path('api-root', api_root, name='api-root'),
    path('posts/', PostList.as_view(), name='post-list'),
    path('comments/', CommentList.as_view(), name='comment-list'),
    path('posts/<int:pk>/add_comment', CommentCreate.as_view(), name='comment-create'),
    path('', post_list_view)
]