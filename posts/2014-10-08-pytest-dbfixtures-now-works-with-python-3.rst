.. title: pytest-dbfixtures now works with python 3
.. slug: pytest-dbfixtures-now-works-with-python-3
.. date: 2014-11-08 19:16:25 UTC+01:00
.. tags: python,pytest,dbfixtures
.. link:
.. description:
.. type: text

Few days ago we've released a python3 compatible version of pytest-dbfixtures,
a pytest plugin with fixtures and factories that can start fresh
mysql, postgresql, elasticsearch, redis, rabbitmq and mongodb processes for Your tests -
and clean their data afterwards. It also provides factories for fixtures
if you'd need more processes of one kind or with different settings.

Unfortunately, if You've been using rabbitmq and/or mysql related fixtures,
please check your tests carefuly, as these fixtures got most backward incompatible changes.

.. TEASER_END

Python 3
--------

We replaced requirement for `MySQLdb <https://pypi.python.org/pypi/MySQL-python>`_
for mysql client fixture with it's python3 compatible fork -
`mysqlclient <https://pypi.python.org/pypi/mysqlclient>`_.

Since mysqlclient is a strightforward fork (keeps event the package name) -
it's still possible to use MySQL-python package for python 2.

For rabbitmq, we replaced `pika <https://pypi.python.org/pypi/pika>`_ with
`rabbitpy <https://pypi.python.org/pypi/rabbitpy>`_ - here unfortunately client connection has
little bit different api.

There are few others changes adjusting code for python3, but nothing more
affecting backward compatibility.

Other changes
-------------

* We removed long deprecated mysqldb_session fixture.
* We've renamed *mysqldb* to *mysql* for consistency with other client fixtures
* **mysqldb** fixture itself has been deprecated.

Links
+++++

Links where pytest-dbfixtures can be found:

#. `pytest-dbfixtures @ pypi <https://pypi.python.org/pypi/pytest-dbfixtures/0.6.0>`_
#. `pytest-dbfixtures @ readthedocs <http://pytest-dbfixtures.readthedocs.org/>`_
#. `pytest-dbfixtures @ github <https://github.com/ClearcodeHQ/pytest-dbfixtures>`_
