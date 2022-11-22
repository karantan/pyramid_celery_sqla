# pyramid_celery_sqla
Testing sandbox for pyramid + celery + sqlalchemy

## Getting Started

Make sure you have a local redis-server running and then do:

```
    $ pip install -e .
    $ celery worker -A pyramid_celery.celery_app --ini development.ini -B
```

You can also run the worker and the beat scheduler separately:

```
    $ celery worker -A pyramid_celery.celery_app --ini development.ini
    $ celery beat -A pyramid_celery.celery_app --ini development.ini
```


```
    $ gunicorn --paste development.ini --bind localhost:8080 --reload --timeout 3600
```