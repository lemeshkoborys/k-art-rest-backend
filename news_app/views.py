from django.shortcuts import render
from rest_framework import generics, status
from rest_framework.views import APIView
from rest_framework.decorators import api_view
from rest_framework.reverse import reverse
from rest_framework.response import Response
from .models import Post, Comment
from .serializers import PostSerializer, CommentSerializer
from django.conf import settings
import requests


@api_view(['GET'])
def api_root(request, format=None):
    return Response({
        'posts': reverse('post-list', request=request, format=format)
    })


class PostList(generics.ListAPIView):

    queryset = Post.objects.all()
    serializer_class = PostSerializer


class PostDetail(generics.RetrieveAPIView):

    queryset = Post.objects.all()
    serializer_class = PostSerializer


class CommentList(generics.ListAPIView):

    queryset = Comment.objects.all()
    serializer_class = CommentSerializer


class CommentCreate(APIView):

    def post(self, request, pk, format=None):
        post = Post.objects.get(pk=pk)
        serializer = CommentSerializer(data=request.data)

        if serializer.is_valid():
            recaptcha_response = request.data['g-recaptcha-response']
            data = {
                'secret': settings.DRF_RECAPTCHA_SECRET_KEY,
                'response': recaptcha_response
            }
            r = requests.post(settings.DRF_RECAPTCHA_URL, data=data)
            result = r.json()
            if result['success']:
                serializer.validated_data['post'] = post
                serializer.save()
                return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


def post_list_view(request):
    return render(request, 'posts/posts.html')


def post_detail_view(request):
    return render(request, 'article_from_json.html')
