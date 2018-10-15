"""k_art_rest URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
import news_app.urls, feedback_app.urls
from index_app.views import index_render, render_404
from django.conf import settings

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', index_render, name='home'),
    path('news/', include(news_app.urls)),
    path('feedback/', include(feedback_app.urls), name='feedback'),
    path('404/', render_404, name='404')
]

urlpatterns += patterns('',
        (r'^static/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.STATIC_ROOT}),
    )
