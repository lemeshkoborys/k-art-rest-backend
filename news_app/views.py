from django.shortcuts import render
from rest_framework import generics, permissions
from rest_framework.decorators import api_view
from rest_framework.reverse import reverse
from rest_framework.response import Response
from .models import Post
from .serializers import PostSerializer


@api_view(['GET'])
def api_root(request, format=None):
    return Response({
        'posts': reverse('post-list', request=request, format=format)
    })


class PostList(generics.ListAPIView):

    queryset = Post.objects.all()
    serializer_class = PostSerializer


def post_list_view(request):
    return render(request, 'posts/posts.html')