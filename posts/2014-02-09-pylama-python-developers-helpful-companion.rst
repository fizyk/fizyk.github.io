.. title: Pylama - Python developer's helpful companion
.. slug: pylama-python-developers-helpful-companion
.. date: 2014/03/09 22:14:45
.. tags: python,linter,pep8
.. link:
.. description:
.. type: text

Everyone might have a hard time to keep his code clean, shiny according to pep8, and not to mention that there are other extensions to ` pep8 <http://legacy.python.org/dev/peps/pep-0008/>`_ rules, like `pyflakes <https://pypi.python.org/pypi/pyflakes>`_, or other linters for that matter. Of course, each linter can be installed, but imagine the need to run each separately, to determine what's in your code that should be fixed. Here comes `Pylama <https://pypi.python.org/pypi/pylama/2.0.4>`_.

.. TEASER_END

Pylama is a tool combining power of other linters. It actually uses them beneath, wrapping in single config, command line tool and provides pre commit hooks for both git and mercurial to keep you from committing code, that violates your established style guide rules.

The linters that can be used are, as per Pylama documentation:

* PEP8
* PEP257
* PyFlakes
* Mccabe
* Pylint

And additionally **gjslint** for checking your javascript style as well. (You need to install `pylama_gjslint <https://pypi.python.org/pypi/pylama_gjslint>`_)
