from rest_framework import serializers
from .models import Post, Comment


class CommentSerializer(serializers.ModelSerializer):

    post = serializers.ReadOnlyField(source='post.title')


    class Meta:
        model = Comment
        fields = (
            'id',
            'author',
            'email',
            'post',
            'content',
            'created'
        )


class PostSerializer(serializers.ModelSerializer):

    comments = CommentSerializer(many=True, read_only=True)

    class Meta:
        model = Post
        fields = (
            'id',
            'title',
            'image',
            'short_content',
            'content',
            'comments',
            'created'
        )
        depth = 1


class PostListSerializer(serializers.ModelSerializer):

    class Meta:
        model = Post
        fields = (
            'id',
            'title',
            'image',
            'short_content',
            'created'
        )