from django.shortcuts import render, get_object_or_404, reverse, get_list_or_404
from django.http import HttpResponseRedirect
from rest_framework import generics, status
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.renderers import TemplateHTMLRenderer
from rest_framework.pagination import PageNumberPagination
from .models import Post, Comment
from .serializers import PostSerializer, CommentSerializer, PostListSerializer
from django.conf import settings
import requests


class PostList(generics.ListAPIView):

    queryset = Post.objects.all()
    serializer_class = PostListSerializer

    renderer_classes = (TemplateHTMLRenderer, )

    pagination_class = PageNumberPagination()

    def get(self, request, *args, **kwargs):
        posts = self.get_queryset()
        result = self.pagination_class.paginate_queryset(posts, request)
        html_context = self.pagination_class.get_html_context()
        links = html_context['page_links']
        context = {
            'posts': result,
            'next': html_context['next_url'],
            'previous': html_context['previous_url'],
            'navigation': links,
            'nav_size': len(links)
            }
        return Response(context, template_name='news/news.html')


class PostDetail(generics.RetrieveAPIView):

    queryset = Post.objects.all()
    serializer_class = PostSerializer

    renderer_classes = (TemplateHTMLRenderer, )

    def get(self, request, *args, **kwargs):
        post = self.get_object()
        article_text = post.content.split('\r\n')
        comments = Comment.objects.all().filter(post=post)
        context = {
            'post': post,
            'article_text': article_text,
            'comments': comments,
            'comments_count': len(comments)
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
