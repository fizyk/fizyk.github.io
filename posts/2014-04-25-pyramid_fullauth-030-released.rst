.. title: pyramid_fullauth 0.3.0 released!
.. slug: pyramid_fullauth-030-released
.. date: 2014/04/25 22:32:29
.. tags: python,pyramid,fullauth,pytest_pyramid,pytest
.. link:
.. description:
.. type: text

After over a month of work I've finally released version 0.3.0 of pyramid_fullauth!
This release changes are mostly to testing the package, as with it, it finally reached 100% code coverage, but along I also introduced automatic style checking with pep8, pylint, pep257 and mccabe linter, so in-code changes were big enough, that I had to release it as a new minor version.

.. TEASER_END


This release's changelog
------------------------

Features
++++++++

- configure root factory if it hasn't been already done
- configure session factory only if it hasn't been configured before
- configure authorization policy only if it hasn't been configured before
- configure authentication policy only if it hasn't been configured before
- logged in user will be redirected always away from login page
- views reorganisation - grouping by their function
- replaced force_logout decorator with logout request method
- small login view simplification

tests
+++++

- rewritten tests to use pytest_pyramid
- unified session with pyramid_basemodel's
- parametrize tests against two most recent pyramid versions and sqlalchemy
- turned on pylama to check code with linters:
    - pep8
    - pep257
    - pyflakes
    - mccabe
- add pytest-dbfixtures, and run tests against postgresql and mysql as well
- drop python 2.6 from tests
- 100% test coverage

Links:
------

Package contains two fixtures and two fixture factories (config and app) to play with in pytest tests.

#. `pyramid_fullauth @ pypi <https://pypi.python.org/pypi/pyramid_fullauth/0.3.0>`_
#. `pyramid_fullauth @ readthedocs <http://pyramid-fullauth.readthedocs.org/>`_
#. `pyramid_fullauth @ github <https://github.com/fizyk/pyramid_fullauth>`_


Plans for the future:
---------------------

- python3 support, in two phases:
    #. partial, for non-social authentication
    #. pull request for pytest-dbfixtures python3 compatibility
    #. full by finding alternative to velruse and/or python-oauth2
- Think through number of events. Views can be easily inherited to extend functionality
- introduce form framework.
