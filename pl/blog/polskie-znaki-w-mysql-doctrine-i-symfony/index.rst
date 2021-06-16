.. title: Polskie znaki w MySQL, doctrine i symfony
.. slug: polskie-znaki-w-mysql-doctrine-i-symfony
.. date: 2010/05/09 12:05:53
.. tags: symfony, doctrine, mysql, unicode, utf8
.. link:
.. description: Niejednokrotnie tworząc bazę danych w MySQL, nie trudno nie zauważyć, iż w świeżej, nieskonfigurowanej instalacji tego systemu zarządzania bazą danych, domyślnym typem kodowania nie jest utf8 tylko cp1252/latin1_swedish. 

Niejednokrotnie tworząc bazę danych w MySQL, nie trudno nie zauważyć, iż
w świeżej, nieskonfigurowanej instalacji tego systemu zarządzania bazą
danych, domyślnym typem kodowania nie jest
`utf8 <http://pl.wikipedia.org/wiki/UTF-8>`_ tylko
`cp1252 <http://pl.wikipedia.org/wiki/ISO_8859-1>`_/`latin1\_swedish <http://pl.wikipedia.org/wiki/ISO_8859-1>`_.

.. TEASE_END

Tworząc aplikację korzystającą z takiej bazy, a samej używającej
unicode, powinniśmy dla świętego spokoju sprawdzić i pilnować z jakiego
kodowania nasza baza danych korzysta. Choćby dlatego, że inna aplikacja
podłączona do takiej bazy danych może mieć problemy z rozpoznaniem i
połapaniem się w tej mieszance kodowań. Nie jest również zbyt
intuicyjnym przechowywanie ciągu znaków zakodowanego w
`unicode <http://pl.wikipedia.org/wiki/Unicode>`_, w strukturze
używającej **cp1252** lub innego systemu kodowania.

Również symfony, z całym przywiązaniem do unicode, nie robi nic, by
wymusić stosowanie tego kodowanie w tworzonych poprzez doctrine
tabelach, czy też samym połączeniu na lini baza danych - aplikacja.
Konieczne jest ręczne ustawienie odpowiednich wartości w pliku
**database.yml**:

.. code-block:: yaml

    all:
      doctrine:
        class: sfDoctrineDatabase
        param:
          #...
          attributes:
            default_table_charset: utf8
            default_table_collate: utf8_general_ci

W ten sposób można w spokoju tworzyć aplikacje używające kodowania
unicode bez obawy wystąpienia błędu nieprawidłowego kodowania znaków w
porównaniu MySQL, lub innych niespodzianek z tym związanych.

Z reguły znaki używane na zachodzie (znaki ASCII) są kodowane w ten sam
sposób w unicode jak i w cp1252/latin1, czego nie można powiedzieć o
polskich ogonkach, czy występujących w czeskim i innych
zachodniosłowiańskich językach ptaszkach (Przykład: Čech).
