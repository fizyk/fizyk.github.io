.. title: pyramid_fullauth can speak Your language now
.. link:
.. tags: python,pyramid,authentication
.. date: 2013/07/27 21:53:29
.. slug: pyramid_fullauth-can-speak-your-language-now
.. description: pyramid_fullauth release 0.1.0. Brings session factory customisation possibility, and pyramid_localize integration, and small password validation improvements

A couple of days ago, I completed and released new version of pyramid_fullauth, now at 0.1. This package aims to provide full authorization and authentication functionality for Your pyramid application. It provides standard email authentication, and by integrating velruse, it also allows for broad spectrum of social and oauth2 services authentication, by just the means of settings config! So what's new in version 0.1?

.. TEASER_END

First of all, thanks to **Veronica Zgirvaci**, fullauth now allows to set custom session factory for pyramid application.  Simply modify these settings in your config file:

.. code-block:: yaml

    fullauth:
        session:
            factory: pyramid.session.UnencryptedCookieSessionFactoryConfig
            settings:
                secret: THATS_NOT_SECRET_ITS_A_SECRET

factory key holds the python path for session factory, while settings, as key name suggests, holds key: value pairs of settings, that should be passed.

Second thing, and for me it's most important in this release, is integration with `pyramid_localize <https://pyramid_localize.readthedocs.org/en/latest/>`_. Right now all strings that comes from pyramid_fullauth to end user, should be translatable, with .pot file delivered inside package itself. By default pyramid_localize does nothing with these strings, as localize installs fake translation methods by default.

Last thing that has changed is small adjustment in password validation. It has been moved into function inside tools module, and now it's used both during registration, and during reset password all the same. And now it rises validation exceptions. I plan using some form framework in future, hopefully one that provides form validation as well.

pyramid_fullauth is like always, avaliable on `pypi <https://pypi.python.org/pypi/pyramid_fullauth/0.1.0>`_ and any issue, should be reported to `github <https://github.com/fizyk/pyramid_fullauth>`_.

Also note, that I've just started migrating fullauth's test to pytest, which I recently discovered.

package stats:

.. image:: https://travis-ci.org/fizyk/pyramid_fullauth.png?branch=master
    :target: https://travis-ci.org/fizyk/pyramid_fullauth
    :alt: Tests for RandomWords

.. image:: https://coveralls.io/repos/fizyk/pyramid_fullauth/badge.png?branch=master
    :target: https://coveralls.io/r/fizyk/pyramid_fullauth?branch=master
    :alt: Coverage Status

.. image:: https://pypip.in/v/pyramid_fullauth/badge.png
    :target: https://crate.io/packages/pyramid_fullauth/
    :alt: Latest PyPI version

.. image:: https://pypip.in/d/pyramid_fullauth/badge.png
    :target: https://crate.io/packages/pyramid_fullauth/
    :alt: Number of PyPI downloads




