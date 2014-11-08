.. title: pyramid_fullauth 0.4 - python3 and few fixes
.. slug: pyramid_fullauth-04-python3-and-few-fixes
.. date: 2014-11-02 19:46:35 UTC+01:00
.. tags: python,pyramid,authentication,fullauth
.. link:
.. description:
.. type: text

I've just released version 0.4 of my pyramid extension,
`pyramid_fullauth <https://pypi.python.org/pypi/pyramid_fullauth>`_.
It's goal is to allow to add authentication abilities - both password- and
social-based authentication - to pyramid based apps by the means of configuration mostly.

This version comes with limited python3 compatibility, and two bugfixes.

.. TEASER_END

Python 3
++++++++

Basic pyramid_fullauth functionality works on all python versions, except for
social/oauth2 authentication. Unfortunately, that's due to
`oauth2 <https://pypi.python.org/pypi/oauth2>`_ package and as it follows
`velruse <https://pypi.python.org/pypi/velruse/1.1.1>`_, which is being used
under the hood.

I'll be looking at other options in the future, but for now, I've decided to
release as much as I could as python3-able, even if a bit-limited. On python 2
everything works as before.

Other changes
+++++++++++++

Main bugfix in this release is that email field will behave case insensitive from now on,
no matter what database backend You're using. It was omitted by me previously,
as I was using the package more thoroughly against mysql, and the case-sensitivity
took it's tool on other backends such as postgres or even sqlite.
As I had no test for that case as well, I haven't realized till
`ddamoursNRC <https://github.com/ddamoursNRC>`_ pointed it out.

Please make sure Your data is unique enough, as the changed code operates
on SQLAlchemy's comparator and hybrid properties that are lowering all input for
email and new_email fields. This is done both while setting new value, reading old,
or issuing a SQL query

The other change is a change adjusting the code to pyramid deprecating the use of
*pyramid.security.authenticated_userid* in favour to *Request.authenticated_userid*.

Links
+++++

Links where pyramid_fullauth can be found:

#. `pyramid_fullauth @ pypi <https://pypi.python.org/pypi/pyramid_fullauth/0.4.0>`_
#. `pyramid_fullauth @ readthedocs <http://pyramid-fullauth.readthedocs.org/>`_
#. `pyramid_fullauth @ github <https://github.com/fizyk/pyramid_fullauth>`_
