.. title: Definiowanie kodowania w plikach źródłowych Pythona
.. slug: definiowanie-kodowania-w-plikach-zrodlowych-pythona
.. date: 2011/12/31 13:12:21
.. tags: unicode, python, pep
.. link:
.. description: Dlaczego definiowanie kodowania w pliku źródłowym Pythona jest istotne?

Dlaczego definiowanie kodowania w pliku źródłowym Pythona jest istotne?

.. TEASER_END

Odpowiedź na to pytanie jest dość prosta. O ile zazwyczaj rozwiązania
powstające na zachodzie są świetne, o tyle nikt tam nie myśli zazwyczaj
dalej niż granica krajów, którym wystarcza zazwyczaj kodowanie określane
mianem **latin1**. Stąd też tyle standardów kodowania ile mamy. W
Pythonie (przynajmniej 2.x) również czysty plik jest  kodowany w 7
bitowym ASCII i tak też interpretowany. 

Chyba, że dodamy w pierwszej, lub drugiej linii pliku deklarację
kodowania np. utf8:

.. code-block:: python

    # Some comment
    # -*- coding: utf-8 -*

Deklaracja taka musi znaleźć się w **każdym** pliku projektu.

Bez tej deklaracji zwykłe stringi, jakie mieścimy w kodzie źródłowym
zostaną wyświetlone poprawnie, jednak jeśli już zaczniemy pisać ą i ę w
stringach Unicode:

.. code-block:: python

    unicode_string = u'ciąg znaków z ą i ę'

Może spowodować błąd, choć nowsze wersje wyświetlą tylko ostrzeżenie.
Python 3 zdaje się już nie sprawia takich problemów z kodowaniem,
rozwiązując problem na korzyść utf8, jednak trochę wody jeszcze upłynie
w odrze, nim się wszyscy przeniosą...

Zmiany te zostały zaproponowane w `PEP
263 <http://www.python.org/dev/peps/pep-0263/>`_ a wprowadzone w
`Pythonie
2.3 <http://docs.python.org/release/2.3/whatsnew/section-encodings.html>`_.
