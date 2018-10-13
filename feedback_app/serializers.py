from rest_framework import serializers
from .models import Feedback, FeedbackCategory


class FeedbackSerializer(serializers.ModelSerializer):

    category = serializers.ReadOnlyField(source='category.title')

    class Meta:
        model = Feedback
        fields = (
            'id',
            'category',
            'name',
            'email',
            'phone',
            'content'
        )
