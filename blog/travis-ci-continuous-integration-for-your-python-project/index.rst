.. tags: python,continuous integration,howto
.. date: 2013/08/03 14:27:15
.. title: Travis-CI - continuous integration for your python project
.. slug: travis-ci-continuous-integration-for-your-python-project
.. link:
.. description: How to use Travis-CI with your project, nad what it is.

A long while ago, with help of Tomek Święcicki, I've discovered `Travis-CI <https://travis-ci.org/>`_, a service that provides Continuous integration, to both open source, and enterprise projects, and that's quite easy to connect to Github repository.

.. TEASER_END

So how does it work? First of all, you need a test suite for your project, and some command to run these tests. Then, at root level of your project, you add **.travis.yaml** file.

There are four required sections:

- **language** - which describes what's the language used in your project.
- **python** - where you define lists of python environments you want to test your package against. You can even check your package against pypy.
- **install** - list of commands used to install your package's test environment. For me it's usually ``python setup.py develop`` and after that pip install package[test] which install packages required to run your tests.
- **script** - the actual test suite script. I've used ``python setup.py nosetests``, but recently I'm switching to py.test.

There's also fifth section, **after_success** which I use to send coverage reports to `coveralls.io <https://coveralls.io/>`_, which then reports any change back to me, and on github, if this is a merge request.

.. note::
    My default **.travis.yaml** file can be checked on my `pypt <https://github.com/fizyk/pypt/blob/master/.travis.yml>`_ repository. Where I keep templates for packages.

Whole process adding your github project to Travis-ci is as simple as login, refreshing your project's list, and simply turning it on on travis-ci pages, which in turn, turns Travis-Ci integration hook on gihub's repository settings. After that every push gets picked up by travis, and defined commands are being run.

Happy testing!



