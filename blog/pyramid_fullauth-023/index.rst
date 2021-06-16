.. link:
.. description:
.. tags: python,pyramid,fullauth
.. date: 2014/01/29 23:06:07
.. title: pyramid_fullauth 0.2.3
.. slug: pyramid_fullauth-023

It took over a four months, but finally got new version of pyramid_fullauth cooked, with three fixes. One relaxing dependency on `tzf.pyramid_yml <https://pypi.python.org/pypi/tzf.pyramid_yml>`_, second adjusts package to `pyramid 1.5a3 <https://pypi.python.org/pypi/pyramid/1.5a3>`_, and third fixes relation definition between AuthenticationProvider and User classes.

.. TEASER_END

This release's changelog
------------------------

- weaker pyramid_yml requirements. Use ``registry['config']`` instead of ``request.config`` which gets added only whet explicitly including tzf.pyramid_yml package.
- remove default_config with permission set for forbidden views. Throwning errors in pyramid 1.5a3
- remove lazy='load' for relationship between AuthenticationProvider and User models as it was incorrect. Fixes error while using with sqlalchemy 0.9

Links:
------

Package contains two fixtures and two fixture factories (config and app) to play with in pytest tests.

#. `pyramid_fullauth @ pypi <https://pypi.python.org/pypi/pyramid_fullauth/0.2.3>`_
#. `pyramid_fullauth @ readthedocs <http://pyramid-fullauth.readthedocs.org/>`_
#. `pyramid_fullauth @ github <https://github.com/fizyk/pyramid_fullauth>`_
