.. title: Python - atrybut instancji, atrybut klasy
.. slug: python-atrybut-instancji-atrybut-klasy
.. date: 2010/11/18 23:11:12
.. tags: python
.. link:
.. description: Python jest dziwnym językiem, językiem silnie zależnym od konwencji. Chociaż wiedziałem, że dużo w tym języku zależy od konwencji, mocno mnie zaskoczyło to, jak bardzo konwencja wpływa na programy w pythonie. Bloki kodu wydzielone poprzez wcięcia to banał.

Python jest dziwnym językiem, językiem silnie zależnym od konwencji.
Chociaż wiedziałem, że dużo w tym języku zależy od konwencji, mocno mnie
zaskoczyło to, jak bardzo konwencja wpływa na programy w pythonie. Bloki
kodu wydzielone poprzez wcięcia to banał.

Poruszyło mnie dość mocno jedna rzecz, deklaracja atrybutów klasy. Zanim
zacząłem pisać pierwszy program w pythonie, trochę poczytałem, więc
mniej więcej wiedziałem, że tworząc klasę, można mieć atrybuty klasy
(statyczne), jak i instancji, do których odwołać można się w następujący
sposób:

::

    class Klasa(object):

        def __init__(self):
            self.someMethod()

        def someMethod(self):
            //atrybut instancji
            self.atrybut
            //atrybut klasy
            self.__class__.atrybut

Oczywiście, nie ma żadnego słowa kluczowego, który by zasugerował, że
atrybut jest taki, lub taki. Ja, jak to mam w zwyczaju, atrybuty
deklaruję zawsze w klasie, a następnie do nich się odwołuję:

::

    class Klasa(object):
        atrybut = []

        def __init__(self):
            self.someMethod()

        def someMethod(self):
            //atrybut instancji
            self.atrybut
            //atrybut klasy
            self.__class__.atrybut

Z takim podejściem jest jeden kłopot. Załóżmy teraz takie odwołanie do
atrybutu w metodzie:

::

    class Klasa(object):
        atrybut = []

        def __init__(self):
            self.someMethod()

        def someMethod(self):
            //atrybut instancji (?)
            self.atrybut.append('string')

Python ma dość nietypowe podejście do atrybutów klasy (*statycznych*).
Po pierwsze, deklaracja atrybutów w ciele klasy jest przede wszystkim
statyczna - atrybuty klasy. I moje przyzwyczajenie nie wydaje się być
złe. Pozwala na deklarację jakichś wartości domyślnych dla obiektów. Co
się natomiast dzieje w metodzie ***someMethod***? Wszelkie przewodniki
twierdzą, że jest to odwołanie do atrybutu klasy, jednak w tym wypadku,
Łańcuch znaków 'string' zostaje dodany do atrybutu statycznego.
Dlaczego, w końcu odwołujemy się teoretycznie do atrybutu instancji?

Jak się okazuje, atrybuty klas w pythonie działają na zasadzie słowników
(coś jak tablica w php, posiada klucze i wartości). W momencie, gdy
atrybutu nie ma w słowniku instancji, jest szukany w słowniku klasy, a
jeśli tam go nie ma, w słowniku klasy, którą nasza rozszerza. W
powyższym przykładzie zadeklarowany jest atrybut klasy, a w metodzie
***someMethod***, odwołanie zostaje skierowane do atrybutu klasy
właśnie. Jak więc dodać atrybut do słownika trybutów instancji? Tylko
poprzez wcześniejszą inicjację atrybutu:

::

    class Klasa(object):
        atrybut = []

        def __init__(self):
            // odwołanie do atrybutu klasy
            self.someMethod()
            // inicjacja atrybutu instancji
            self.atrybut = []
            // odwołanie do atrybutu instancji
            self.someMethod()

        def someMethod(self):
            //atrybut instancji (?)
            self.atrybut.append('string')

Zanim się w tym zorientowałem, doprowadziłem do małego wycieku pamięci
;-).

Więcej do poczytania (po angielsku) na ten temat można znaleźć w tych linkach:
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

`http://www.pasteur.fr/formation/infobio/python/ch18s05.html <http://www.pasteur.fr/formation/infobio/python/ch18s05.html>`_

`http://docs.python.org/tutorial/classes.html#python-scopes-and-namespaces <http://docs.python.org/tutorial/classes.html#python-scopes-and-namespaces>`_
