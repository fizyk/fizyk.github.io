.. link:
.. description:
.. tags: python,email,smtp,tip
.. date: 2013/11/10 20:39:54
.. title: Easy way to debug email communication in python
.. slug: easy-way-to-debug-email-communication-in-python

I might not be fond of Django itself, but one can learn a thing or two from it. For example, if it wasn't for working with Django, I'd probably miss the fact, that you can start a simple smtp server to debug email communications in your apps (no matter the programming language).

.. code-block:: bash

    python -m smtpd -n -c DebuggingServer localhost:1025

It's simple as that. Now you can just configure your app to use smtp connection as passed to smtpd server here.
