from django.shortcuts import render, reverse, render_to_response
from django.http import HttpResponseRedirect


def index_render(request):
    return render(request, 'index.html')


def render_404(request):
    return request(request, '404.html')


def render_500(request):
    return render_to_response('500.html')
