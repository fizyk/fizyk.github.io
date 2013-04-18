.. title: Format date for RSS/Atom
.. slug: format-date-for-rssatom
.. date: 2013/04/17 22:22:14
.. tags: python,date,timezone,rfc3339
.. link:
.. description: How to format and localize date in python

While importing posts from my old Blog to `Nikola <http://nikola.ralsina.com.ar/>`_, I considered generating a big atom feed, and import it using Nikola importers. I finally generated all post files by hand, but along the way I found how to correctly format DateTime object to match `rfc3339 <http://www.ietf.org/rfc/rfc3339.txt>`_ which is required for RSS or Atom feeds.


.. TEASER_END

Obviously there's an `rfc3339 libary <https://pypi.python.org/pypi/rfc3339>`_ which will help you get desired format, and correct date printed.

.. code-block:: python

    >>> from rfc3339 import rfc3339
    >>> from datetime import datetime
    >>>
    >>> now = datetime.strptime('2013/04/17 22:22:14', '%Y/%m/%d %H:%M:%S')
    >>> now
    datetime.datetime(2013, 4, 17, 22, 22, 14)
    >>> rfc3339(now)
    '2013-04-17T22:22:14+02:00'


It might happen however, that your datetime does not have timezone info on this, and you're working on system, which has different timezone set. In this case, you'll also need **pytz** library and create required timezone yourself, and localize the date:

.. code-block:: python

    >>> import pytz
    >>> warsaw = pytz.timezone('Europe/Warsaw')
    >>> warsaw.localize(now)
    datetime.datetime(2013, 4, 17, 22, 22, 14, tzinfo=<DstTzInfo 'Europe/Warsaw' CEST+2:00:00 DST>)
    >>> rfc3339(warsaw.localize(now))
    '2013-04-17T22:22:14+01:00'

Of course, there's also the issue to find out the timezone the date was originally stored with if we retrieve it from database.



