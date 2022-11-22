from pyramid.config import Configurator
from wsgiref.simple_server import make_server
from pyramid.config import Configurator
from pyramid.response import Response

def main(global_config, **settings):
    """ This function returns a Pyramid WSGI application.
    """
    settings['message'] = "The current date is %s"
    config = Configurator(settings=settings)
    config.scan()

    config.add_route('hello', '/')
    config.add_view(hello_world, route_name='hello')
    return config.make_wsgi_app()


def hello_world(request):
    return Response('Hello World!')