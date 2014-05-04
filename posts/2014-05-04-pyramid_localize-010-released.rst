.. title: pyramid_localize 0.1.0 released
.. slug: pyramid_localize-010-released
.. date: 2014/05/04 19:08:27
.. tags: python,pyramid,i18n
.. link:
.. description:
.. type: text

I've just released 0.1 version pf pyramid_localize. It's stacks mostly changes
I had hanging around on **0.1a***, but while rewriting tests to py.test and
adding pylama checks, I made some smaller changes in code, and decided to publish
it as a new version already.

.. TEASER_END

**pyramid_localize** is a pyramid extension providing ready-to-use, translation
functionality for your pyramid based projects. All you need is to add Babel,
and add some configuration. localize provides also a web interface that allows
you to reload translations live, without reloading application.

Changelog
---------

- weaker pyramid_yml requirements. Use ``registry['config']`` instead of ``request.config`` which gets added only when explicitly including tzf.pyramid_yml package.
- deprecated request.locale in favour of request.locale_name delivered by Pyramid 1.5
- moved locale negotiator into it's own submodule

backward incompatible
+++++++++++++++++++++
- required cookie name changed to _LOCALE_ to be consistent with other places
- fixed a typo from catalog to catalogue

tests
+++++
- refactor tests to pytest
- introduced pylama checks for:
    - pep8
    - pyflakes
    - pep257
    - mccabe

- license information
- requires at least pyramid 1.5a1 (rely on default localizer reify method)
- py3 compatibility (require at least babel 1.0)
- locale negotiator looks first for request attribute _LOCALE_
- added pyramid_mako dependency (required by pyramid 1.5a2 changes)


Links:
------

Package contains two fixtures and two fixture factories (config and app) to play with in pytest tests.

#. `pyramid_localize @ pypi <https://pypi.python.org/pypi/pyramid_localize/0.1.0>`_
#. `pyramid_localize @ readthedocs <http://pyramid-localize.readthedocs.org/>`_
#. `pyramid_localize @ github <https://github.com/fizyk/pyramid_localize>`_
