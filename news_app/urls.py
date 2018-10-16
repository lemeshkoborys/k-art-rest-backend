from django.urls import path
from .views import (
    PostList,
    CommentCreate,
    PostDetail
)

urlpatterns = [
    path('', PostList.as_view(), name='post-list'),
    path('<int:pk>/', PostDetail.as_view(), name='post-detail'),
    path('<int:pk>/add_comment', CommentCreate.as_view(), name='comment-create')
]
