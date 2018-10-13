from django.shortcuts import render


def index_render(request):
    return render(request, 'index.html')


def render_404(request):
    return request(request, '404.html')
