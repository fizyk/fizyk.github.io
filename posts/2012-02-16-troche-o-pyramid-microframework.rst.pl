.. title: Trochę o pyramid microframework
.. slug: troche-o-pyramid-microframework
.. date: 2012/02/16 21:02:15
.. tags: framework, python, pyramid, microframework
.. link:
.. description: W ciągu ostatnich kilku dni miałem okazję zapoznać się z nowym (dla mnie) web frameworkiem, kolejnym po web2py frameworkiem pythonowym. W ramach nowego podprojektu postanowiliśmy wykorzystać coś innego i wybór padł na microframework pyramid.

W ciągu ostatnich kilku dni miałem okazję zapoznać się z nowym (dla
mnie) web frameworkiem, kolejnym po **web2py** frameworkiem pythonowym.
W ramach nowego podprojektu postanowiliśmy wykorzystać coś innego i
wybór padł na microframework
`pyramid <http://www.pylonsproject.org/projects/pyramid/about>`_.

.. TEASER_END

pyramid należy do dość specyficznej grupy frameworków, jest to tak zwany
microframework, który oprócz tego, że korzystamy z pyramida nie wymaga
niczego więcej. Nie narzuca od góry żadnej metody dostępu do danych,
prezentacji, ani innych bibliotek. Kilka takich dostarcza, ale nie są
one absolutnie do niczego potrzebne. Prezentuje kierunek, w którym od
wersji 2.0 idzie `symfony <http://symfony.com/>`_.

Dzięki tej budowie, nadaje się do tworzenia zarówno dużych aplikacji,
jak i niewielkich, takich, które praktycznie nie mają wpływu na system
(choć zawsze może się zdarzyć tak zwane Duże Zainteresowanie Aplikacją).

Prosta aplikacja w pyramidzie może zawierać się w jednym pliku:

.. code-block:: pyhton

    from wsgiref.simple_server import make_server
    from pyramid.config import Configurator
    from pyramid.response import Response

    def hello_world(request):
        return Response('Hello %(name)s!' % request.matchdict)

    if __name__ == '__main__':
        config = Configurator()
        config.add_route('hello', '/hello/{name}')
        config.add_view(hello_world, route_name='hello')
        app = config.make_wsgi_app()
        server = make_server('0.0.0.0', 8080, app)
        server.serve_forever()

I wszystko to w 15 liniach. W kilku następnych postach postaram się
przedstawić, jak stworzyć prostą aplikację razem ze znajomą strukturą
plików (wiadomo, przyzwyczajenie).

Przy aplikacji w pracy używamy jeszcze
`sqlalchemy <http://www.sqlalchemy.org/>`_ i szablonów
`mako <http://www.makotemplates.org/>`_, więc ich użycie też postaram
się opisać. Jedno, czego nie użyliśmy, to
`paster <http://docs.pylonsproject.org/projects/pyramid/en/latest/api/paster.html>`_.
Pozwala przyspieszyć proces tworzenia aplikacji, ale postanowiliśmy
zrobić wszystko ręcznie, żeby zobaczyć i zrozumieć trybiki pyramida od
środka.

Na pewno jeszcze muszę się dokładniej przyjrzeć sqlalchemy, przydałaby
się możliwość migracji schematu bazy danych. I rozejrzeć się za jjakimś
ciekawym frameworkiem formularzy.
