.. title: Unicode a python
.. slug: unicode-a-python
.. date: 2011/02/06 18:02:36
.. tags: unicode, python, string
.. link:
.. description: Od paru miesięcy programuję w Pythonie. Najpierw oczywiście trzeba się było Pythona nauczyć, zanim zacząłem w robocie dostawać pierwsze zadania, ale źle nie było. Jedna rzecz mnie w Pythonie zdziwiła, a mianowicie podejście do kodowania stringów. Zresztą, po dziś dzień rozwiązanie tej kwestii w Pythonie sprawia mi niemały kłopot.

Od paru miesięcy programuję w Pythonie. Najpierw oczywiście trzeba się
było Pythona nauczyć, zanim zacząłem w robocie dostawać pierwsze
zadania, ale źle nie było. Jedna rzecz mnie w Pythonie zdziwiła, a
mianowicie podejście do kodowania stringów. Zresztą, po dziś dzień
rozwiązanie tej kwestii w Pythonie sprawia mi niemały kłopot.

Otóż w Pythonie, by ciąg znaków mógł zawierać wszelkie krzaczki i
ogonki, musi być unicodowym ciągiem znaków. Zwykłe stringi akceptują
tylko i wyłącznie znaki ASCII.

I tak deklarując zmienną w kodzie, na pewno będzie stringiem.

.. code-block:: python

    zmienna = 'łańcuch'

Raczej bez różnicy, jakich znaków użyjemy. Jeśli jednak wartość zmienna
zostaje wczytana z zewnętrznego źródła danych, wtedy możemy napotkać
problem.

Załóżmy teraz, że wczytujemy i przetwarzamy jakiś dokument XML, są one
kodowane przeważnie w utf-8. Wartości które będziemy przeważnie
przetwarzali zazwyczaj zmieszczą się w spektrum kodowania ASCII i ich
konwersja będzie jakby automatyczna, jednak co jakiś czas natrafimy w
pobieranych wartościach na polskie ogonki, czeskie ptaszki albo chińskie
krzaczki. Wtedy albo program się wywali (na naszym kodzie, np. złączeniu
łańcuchów) stwierdzając, że znak w łańcuchu jest spoza zakresu ASCII
(lub podobny błąd), albo błąd zwróci wywoływana przez nas funkcja.
jakkolwiek wydaje się to zabawne, spora część funkcji nie radzi sobie z
Unicode.

Jak to obejść? Wyłapać się wszystkiego w czasie pisania nie da, można
chyba tylko przed wywołaniem, które zwraca błąd zastosować poniższą
konstrukcję:

.. code-block:: python

    if isinstance(zmienna, unicode):
        zmienna = zmienna.encode('utf-8')

Gdy po raz pierwszy spotkałem się z tym problemem, znalazłem informację
o możliwości zdefiniowania kodowania plików źródłowych:

.. code-block:: python

    # -*- coding: utf-8 -*-

Ta konstrukcja służy jednak tylko i wyłącznie zdefiniowaniu kodowania
kodu źródłowego, nie kodowania używanego przez Pythona. Stąd w swoich
pierwszych programach napisanych w pythonie używałem sporo wywołań
metody encode i decode na stringu.
