from django.shortcuts import (
    render,
    get_object_or_404,
    reverse
)

from django.http import HttpResponseRedirect

from .models import (
    Feedback,
    FeedbackCategory
)

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .serializers import FeedbackSerializer
from django.core.mail import send_mail
from django.conf import settings
import requests


def send_email_to_admin(email, content):
    admin_subject = 'K-art. Новая обратная связь на Вашем сайте'
    admin_message = "Новая обратная связь: \n" + str(content) + "\n \n \n" + "Email отправителя: " + email
    admin_email_from = settings.EMAIL_HOST_USER
    admin_recipient_list = ['lemeshko.borys@gmail.com']
    send_mail(admin_subject, admin_message, admin_email_from, admin_recipient_list)

    subject = 'K-art. Обратная связь'
    message = "Спасибо за обратную связь!\n" \
              "В скором времени мы с вами свяжемся\n \n \n"" \
                          ""С уважением команда k-art"
    email_from = settings.EMAIL_HOST_USER
    recipient_list = [email, ]

    send_mail(subject, message, email_from, recipient_list)


class FeedbackCreate(APIView):

    def post(self, request, format=None):
        category = FeedbackCategory.objects.get(pk=request.data['category'])
        serializer = FeedbackSerializer(data=request.data)
        if serializer.is_valid():
            recaptcha_response = request.data['g-recaptcha-response']
            data = {
                'secret': settings.DRF_RECAPTCHA_SECRET_KEY,
                'response': recaptcha_response
            }
            r = requests.post(settings.DRF_RECAPTCHA_URL, data=data)
            result = r.json()

            if result['success']:
                if category:
                    serializer.validated_data['category'] = category
                else:
                    serializer.validated_data['category'] = 'None'
                email = serializer.validated_data['email']
                content = serializer.validated_data['content']
                send_email_to_admin(email, content)
                serializer.save()
                return HttpResponseRedirect(reverse('feedback', args=None))
            else:
                return HttpResponseRedirect(redirect_to='404.html')
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


def feedback_render(request):
    categories = FeedbackCategory.objects.all()
    return render(request, 'feedback/feedback.html', {'categories': categories})
