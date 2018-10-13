from django.shortcuts import render, get_object_or_404, reverse
from django.http import HttpResponseRedirect
from rest_framework import generics, status
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.renderers import TemplateHTMLRenderer
from .models import Post, Comment
from .serializers import PostSerializer, CommentSerializer, PostListSerializer
from django.conf import settings
import requests


class PostList(generics.ListAPIView):

    queryset = Post.objects.all()
    serializer_class = PostListSerializer

    renderer_classes = (TemplateHTMLRenderer, )

    def get(self, request, *args, **kwargs):
        posts = self.get_queryset()
        return Response({'posts': posts}, template_name='news/news.html')


class PostDetail(generics.RetrieveAPIView):

    queryset = Post.objects.all()
    serializer_class = PostSerializer

    renderer_classes = (TemplateHTMLRenderer, )

    def get(self, request, *args, **kwargs):
        post = self.get_object()
        comments = Comment.objects.all().filter(post=post)
        context = {
            'post': post,
            'comments': comments
        }
        return Response(context, template_name='news/article.html')


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
                return HttpResponseRedirect(reverse('post-detail', args=[post.id]))
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


def post_list_view(request):
    return render(request, 'posts/posts.html')


def post_detail_view(request):
    return render(request, 'article_from_json.html')
