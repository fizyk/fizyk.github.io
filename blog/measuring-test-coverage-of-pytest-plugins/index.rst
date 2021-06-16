.. title: Measuring test coverage of py.test plugins
.. slug: measuring-test-coverage-of-pytest-plugins
.. date: 2014-11-16 16:54:42 UTC+01:00
.. tags: pytest,python,coverage
.. link:
.. description:
.. type: text

Measuring your code's test coverage is important, though not definitive metric
to tell that Your code is well tested. But to measure coverage properly, tests
have to be properly initialized as well. And today I asked myself a question,
how do I measure properly test coverage of `py.test <http://pytest.org/>`_
plugins?

.. TEASER_END

Py.test plugins are quite tricky, because they get initialized on test session
start, that is even before coverage will kick in - even though
`pytest-cov <https://pypi.python.org/pypi/pytest-cov>`_ since version 1.7 it
kicks in in exact moment, thanks to a pytest_sessionstart hook.

And just today, I was toying with the idea looking first at recent changes in
pytest-cov, and it occurred to me, that to get full coverage of pytest plugin,
I actually have to turn it off!

.. code-block::

    py.test -p no:pytest-plugin

But how do we use plguin's fixtures and configuration then? Well, it's enough
to import everything from the plugin in test's *conftest.py* file!

.. code-block:: python

    from pytest_plugin.plugin import *

This will make your plugin's fixture to kick in, as well as any configuration
option your pytest plugin might require.

Results can be seen on `coveralls.io <https://coveralls.io/>`_ for both plugins
I contribute to:
`pytest-dbfixtures <https://coveralls.io/builds/1481408>`_ and
`pytest_pyramid <https://coveralls.io/builds/1481430>`_

Of course, code coverage can tell you only, what percentage of code has been
touched by tests. Not if it is properly tested!
