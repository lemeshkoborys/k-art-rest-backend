FROM python:3.6.6

ENV PYTHONUNBUFFERED 1

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-client \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /k-art
COPY requirements.txt /k-art
RUN pip install -r requirements.txt
COPY . /k-art
RUN ./manage.py collectstatic --no-input

EXPOSE 8001
CMD ["gunicorn", "--bind", ":8001", "k_art_rest.wsgi:application"]