.. link:
.. description:
.. tags: python,tip,benchmark
.. date: 2013/07/17 23:08:14
.. title: unicode is faster than decode
.. slug: unicode-is-faster-than-decode

This might come as a surprise, but in python 2.7, it's actually faster to decode strigs with unicode function, than decode method.

.. code-block:: python

    >>> from timeit import Timer
    >>> s = "grzegrzółka"
    >>> ts = Timer(lambda: s.decode('utf-8'))
    >>> ts.timeit()
    1.4051871299743652
    >>> tu = Timer(lambda: unicode(s, 'utf-8'))
    >>> tu.timeit()
    0.4272959232330322

Of course, unicode method isn't valid for python3, but you can always mock it's behaviour for py3 in some compat.py file, but... strings in python3 are finally unicode, not ascii like in python2.7,so unless you develop some nice library, you probably know what python version will be running your project.
