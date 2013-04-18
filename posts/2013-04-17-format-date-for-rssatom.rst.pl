.. title: Format date for RSS/Atom
.. slug: format-date-for-rssatom
.. date: 2013/04/17 22:22:14
.. tags: python,date,strefa czasowa,rfc3339
.. link:
.. description: Jak sformatować i zlokalizować strefę czasową w Pythonie.

Podczas importowania moich postów ze starego bloga do `Nikoli <http://nikola.ralsina.com.ar/>`_, zastanawiałem się nad wygenerowaniem pliku atom i zaimportowaniem go do Nikoli używając jednego z jej importerów. Ostatecznie wygenerowałem same pliki z postami, ale po drodze dowiedziałem się, jak sformatować obiekt DateTime zgodnie z normą `rfc3339 <http://www.ietf.org/rfc/rfc3339.txt>`_ (która jest wymagana przez protokół Atom i RSS)


.. TEASER_END

Istnieje oczywiście `biblioteka rfc3339 <https://pypi.python.org/pypi/rfc3339>`_ która pomoże zformatować datę poprawnie:

.. code-block:: python

    >>> from rfc3339 import rfc3339
    >>> from datetime import datetime
    >>>
    >>> now = datetime.strptime('2013/04/17 22:22:14', '%Y/%m/%d %H:%M:%S')
    >>> now
    datetime.datetime(2013, 4, 17, 22, 22, 14)
    >>> rfc3339(now)
    '2013-04-17T22:22:14+02:00'

Może się jednak zdażyć, że obiekt nie posiada określonej strefy czasowej, a pracujesz na systemie, który posiada inną strefę czasową ustawioną. W tym wypadku potrzebna będzie również biblioteka **pytz** i stworzenie konkretnej strefy czasowej, a następnie "zlokalizowanie' daty:

.. code-block:: python

    >>> import pytz
    >>> warsaw = pytz.timezone('Europe/Warsaw')
    >>> warsaw.localize(now)
    datetime.datetime(2013, 4, 17, 22, 22, 14, tzinfo=<DstTzInfo 'Europe/Warsaw' CEST+2:00:00 DST>)
    >>> rfc3339(warsaw.localize(now))
    '2013-04-17T22:22:14+01:00'

Jest oczywiście problem określenia strefy zcasowej, z jaką data została utworzona, jeśli pobieramy ją z bazy danych...



