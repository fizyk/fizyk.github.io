.. link:
.. description:
.. tags: pytest,pyramid,testing
.. date: 2014/01/12 22:59:05
.. title: pytest_pyramid - to ease testing pyramid apps in pytest suite
.. slug: pytest_pyramid-to-ease-testing-pyramid-apps-in-pytest-suite

I've just released **pytest_pyramid**, a package, that should help testing pyramid applications with pytest suite. It's mostly generalized code, that I've been using across my projects to create both configuration and testing application.

.. TEASER_END

Links:

Package contains two fixtures and two fixture factories (config and app) to play with in pytest tests.

# `pytest_pyramid @ pypi <https://pypi.python.org/pypi/pytest_pyramid/0.1.0>`_
# `pytest_pyramid @ readthedocs <http://pytest-pyramid.readthedocs.org/en/latest/>`_
# `pytest_pyramid @ github <https://github.com/fizyk/pytest_pyramid>`_

PyPI also contains egg and wheel. It's my first attempt to create these, so I'm little surprised that they're marked as python 2.7 packages. Well.. If anyone can point me to how to package them for all python versions described in setup.py, I'd be very happy.
