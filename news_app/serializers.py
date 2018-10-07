from rest_framework import serializers
from .models import Post, Comment


class CommentSerializer(serializers.ModelSerializer):

    post = serializers.ReadOnlyField(source='post.title')

    class Meta:
        model = Comment
        fields = ('id', 'author', 'email', 'post', 'content')


class PostSerializer(serializers.ModelSerializer):

    comments = CommentSerializer(many=True, read_only=True)

    class Meta:
        model = Post
        fields = ('id', 'title', 'image', 'content', 'comments')
        depth = 1
