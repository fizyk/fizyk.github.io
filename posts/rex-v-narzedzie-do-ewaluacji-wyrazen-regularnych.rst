.. title: Rex V: narzędzie do ewaluacji wyrażeń regularnych
.. slug: rex-v-narzedzie-do-ewaluacji-wyrazen-regularnych
.. date: 2010/07/25 13:07:39
.. tags: php, pcre, posix, regular expressions, regexp
.. link:
.. description: Ostatnio w projekcie musiałem zaprząc do pracy swoje nieco zakurzone umiejętności pisania wyrażeń regularnych. Po paru początkowych próbach, postanowiłem jednak znaleźć narzędzie, które przyśpieszy ocenę zastosowania opracowywanego wyrażenia. I znalazłem całkiem zgrabne narzędzie: Rex V.

Ostatnio w projekcie musiałem zaprząc do pracy swoje nieco zakurzone
umiejętności pisania wyrażeń regularnych. Po paru początkowych próbach,
postanowiłem jednak znaleźć narzędzie, które przyśpieszy ocenę
zastosowania opracowywanego wyrażenia. I znalazłem całkiem zgrabne
narzędzie: `Rex V <http://www.rexv.org/>`_.

Wystarczy wpisać wyrażenie regularne, testowy ciąg znaków i narzędzie
wyświetla nam zarówno trafienia, jak i efekt zamiany. Ponieważ do
wyrażeń regularnych można dodać opcje takie jak oznaczenie wyrażenia
jako utf-8 (*u - use Unicode*), czy brak zwracania uwagi na wielkość
liter (*i - Case-Insensitive*). Wszystkie te opcje można uruchomić bądź
wyłączyć jednym kliknięciem. A ponieważ narzędzie to oparte jest na
ajaksie, wyniki otrzymujemy natychmiast po dokonanej zmianie.

Rex V obsługuje zarówno wyrażenia PCRE, Posix jak dla JavaScript.
