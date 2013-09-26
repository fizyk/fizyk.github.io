.. title: pyramid_fullauth 0.2.0
.. slug: pyramid_fullauth-020
.. link:
.. description:
.. tags: pyramid,fullauth,release,csrf
.. date: 2013/09/26 22:26:47

I've just released new version of pyramid_fullauth v0.2.0. It gained License, test were rewritten to py.test, and CSRF token handling seen major overhaul.

.. TEASER_END

Also, activation page no longer gives Not Found error, after the code has been used, just displays message about token being invalid/used. This might be more meaningful for Your end users.

Full Changelog for 0.2.0
------------------------

- migrated tests to py.test
- removed nose and lxml from test requirements
- extracted UserEmailMixin from User model
- validation exception improvements
- set licensing to MIT License
- fixed general error message for register_POST processing
- activate action no longer gives 404 error after first use. Default is message about token being invalid or used [veronicazgirvaci]
- extending csrf_check predicate:
    - Can be turned on/off in settings.
    - Failed check rises 401 Unauthorised error

**backward incompatibilities**

- token variable is changed into csrf_token in fullatuh views
- view no longer returns error messages on failed csrf token. Rises 401 Unauthorised error instead.


As always, package can be found on pypi `pyramid_fullauth 0.2.0 <https://pypi.python.org/pypi/pyramid_fullauth/0.2.0>`_
