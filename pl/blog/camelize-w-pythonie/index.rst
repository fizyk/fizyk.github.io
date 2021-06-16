.. title: camelize w pythonie
.. slug: camelize-w-pythonie
.. date: 2011/04/28 20:04:39
.. tags: python, camelize
.. link:
.. description: Co chwilę odkrywam ciekawe konstrukcje, które można zastosować w pythonie, ciągle się uczę i na chwilę obecną Python bawi mnie bardziej, niż PHP. Ma swoje plusy i minusy, tak samo jak PHP, ale jest na tyle ciekawy, że warto się nad tym językiem pochylić.

Co chwilę odkrywam ciekawe konstrukcje, które można zastosować w pythonie, ciągle się uczę i na chwilę obecną Python bawi mnie bardziej, niż PHP. Ma swoje plusy i minusy, tak samo jak PHP, ale jest na tyle ciekawy, że warto się nad tym językiem pochylić.

.. TEASER_END

Jakiś czas temu potrzebowałem "uwielbłądzić" ciąg znaków. Jak to osiagnąć? w Pythonie zajmie to tylko jedną linijkę kodu! Oczywiście przy założeniu, że kod jest dodatkowo sformatowany: jedna instrukcja, jedna linia:

.. code-block:: python

    ''.join([chunk.strip().capitalize() for chunk in 'string_with_dashes'.split('_')])

Ta instrukcja zwróci nam ładnego stringa "StringWithDashes" którego z kolei możemu użyć w metodzie getattr, aby np. dynamicznie wywoływać metodę na obiekcie zależnie od wartości camelizowanego ciągu znaków.
