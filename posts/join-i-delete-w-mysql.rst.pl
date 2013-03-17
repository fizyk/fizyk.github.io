.. title: JOIN i DELETE w mySQL
.. slug: join-i-delete-w-mysql
.. date: 2012/02/15 21:02:53
.. tags: mysql, sql
.. link:
.. description: Parę dni temu zdarzyło się próbować usunąć rekordy z bazy mySQL, które warunki do usunięcia spełniały w innych tabelach. I o ile programistycznie, można cel osiągnąć za pomocą kilku odwołań do bazy, to jednak postanowiłem wykonać jedno.

Parę dni temu zdarzyło się próbować usunąć rekordy z bazy mySQL, które
warunki do usunięcia spełniały w innych tabelach. I o ile
programistycznie, można cel osiągnąć za pomocą kilku odwołań do bazy, to
jednak postanowiłem wykonać jedno.

Jak wygląda standardowe zapytanie DELETE każdy wie. Wychodząc z tego
punktu, szybko rozszerzyłem podstawową wersję zapytania o JOIN i Aliasy:

::

    DELETE FROM table AS t
    LEFT JOIN other_table AS o ON o.table_id=t.id WHERE o.condition=1;

Niestety, może i klient mySQL przełknie to zapytanie, ale sam mySQL już
nie. Zapytanie poprawnie powinno wyglądać tak:

::

    DELETE t FROM table AS t
    LEFT JOIN other_table AS o ON o.table_id=t.id WHERE o.condition=1;

Gdzie ustalamy, z której tabeli konkretnie chcemy usunąć wiersze. Więcej
na ten temat można przeczytać o dziwo w `dokumentacji
mySQL <http://dev.mysql.com/doc/refman/5.1/en/delete.html>`_.
Oczywiście, można jeszcze próbować zapytań zagnieżdżonych:

::

    DELETE FROM table WHERE id IN
    (SELECT table_id FROM other_table WHERE condition=1);

