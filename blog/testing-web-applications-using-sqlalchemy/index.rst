.. title: Testing web applications using SQLAlchemy.
.. slug: testing-web-applications-using-sqlalchemy
.. date: 2014/04/09 23:13:57
.. tags: sqlalchemy,python,pytest-dbfixtures,fullauth
.. link:
.. description:
.. type: text

Some time ago, I decided to refactor `pyramid_fullauth <https://pypi.python.org/pypi/pyramid_fullauth>`_ tests from mostly unittest style
(though run by py.test) to same factor function style tests and base them on
`pytest_pyramid <https://pypi.python.org/pypi/pytest_pyramid>`_ package,
when it comes to test webapp. Everhything went smoothly,
until I stumbled upon `SQLAlchemy <http://www.sqlalchemy.org/>`_ session in tests.

.. TEASER_END

First problem was to control sqlalchemy's session in web application,
which was different than in test fixtures. Somehow the data entered into one
session, wasn't visible in another within the same process (used by application).
That's something I haven't figured out why, and would be grateful
for any explanation, however I managed to get around it. I've just made sure,
that both in test and within application, the same session is being used.

I made sure that the connection is being set up by me in fixture, and then assigned it to the pyramid_basemodel's global Session attribute. To make sure, I'm not using local copy anywhere in the pyramid_fullauth, I treat the Session as pyramid_basemodel's attribute, by calling it always through full namespace.

.. code-block:: python

    import pyramid_basemodel

    # ...

    @pytest.fixture(scope='function', params=['sqlite', 'mysql', 'postgresql'])
    def db_session(request):
        """SQLAlchemy session."""
        from pyramid_fullauth.models import Base

        if request.param == 'sqlite':
            connection = 'sqlite:///fullauth.sqlite'

        engine = create_engine(connection, echo=False)
        pyramid_basemodel.Session = scoped_session(
            sessionmaker(extension=ZopeTransactionExtension()))
        pyramid_basemodel.bind_engine(engine, pyramid_basemodel.Session, should_drop=True)


That's it! Of course, I have to remember to use **transaction.commit()**,
not **Session.commit()**, and that by default ZopeTransactionExtension closes
connection after commit, so all instances need to be merged back into session.
Very misleading that one, when working with code, that does not modify session's
behaviour that much, like flask-sqlalchemy.

The other problem, was closing connection, which suddenly became an issue when
testing with postgresql.
I employed `pytest-dbfixtures <https://pypi.python.org/pypi/pytest-dbfixtures>`_
for starting database processes as needed in tests. dbfixtures povides both
process fixtures and client fixtures.

Process is session scoped, while client, is function scoped, and creates database
at the beginning of a test, and drops it right after. Using sqlalchemy session
underneath, I created physically two connections to that database. And surprisingly,
when client fixture tries to drop databse, the SQLALchemy's connection still lives!
It didn't disturb mysqldb, but did disturb postgresql, which couldn't drop database.
When you think about it, mysql behaves rather strange here, although more convenient.
So the question was, how to close SQLALchemy's connection?

Answer came in this `stackoverflow thread <http://stackoverflow.com/questions/7186961/how-do-i-close-the-engine-created-by-sqlalchemy-ext-sqlsoup>`_, **engine.dispose()**! However it's
`follow-up  <http://stackoverflow.com/questions/21738944/how-can-i-properly-close-a-sqlalchemy-session>`_ had cleaner solution, to use **NullPool** instead! This, when closing session, instead moving connection back to pool, just closes it, as there's no connection pool!

So, after this, the whole sqlalchemy session fixture looks like that:

.. code-block:: python

    @pytest.fixture(scope='function', params=['sqlite', 'mysql', 'postgresql'])
    def db_session(request):
        """SQLAlchemy session."""
        from pyramid_fullauth.models import Base

        if request.param == 'sqlite':
            connection = 'sqlite:///fullauth.sqlite'
        elif request.param == 'mysql':
            request.getfuncargvalue('mysqldb')  # takes care of creating database
            connection = 'mysql+mysqldb://root:@127.0.0.1:3307/tests?charset=utf8'
        elif request.param == 'postgresql':
            request.getfuncargvalue('postgresql')  # takes care of creating database
            connection = 'postgresql+psycopg2://postgres:@127.0.0.1:5433/tests'

        engine = create_engine(connection, echo=False, poolclass=NullPool)
        pyramid_basemodel.Session = scoped_session(sessionmaker(extension=ZopeTransactionExtension()))
        pyramid_basemodel.bind_engine(engine, pyramid_basemodel.Session, should_drop=True)

        def destroy():
            transaction.commit()
            Base.metadata.drop_all(engine)

        request.addfinalizer(destroy)

        return pyramid_basemodel.Session



