.. title: Zmiana modelu dziedziczenia w pluginie sfForkedDoctrineApply
.. slug: zmiana-modelu-dziedziczenia-w-pluginie-sfforkeddoctrineapply
.. date: 2010/07/08 22:07:54
.. tags: symfony, doctrine, inheritance, plugin, sfForkedDoctrineApply, column_aggregation
.. link:
.. description: Od wersji 1.3.0 pluginu sfForkedDoctrineApply nastąpi zmiana modelu dziedziczenia doctrine modelu profilu, z simple na column_aggregation.

Od wersji 1.3.0 pluginu **sfForkedDoctrineApply** nastąpi zmiana modelu
dziedziczenia doctrine modelu profilu, z simple na column\_aggregation.

.. TEASER_END

Wpływ jaki ta zmiana będzie miała na projekty używające
sfForkedDoctrineApply:

-  Możliwość implementacji różnych typów profili i hydracji tych profili
   z bazy według ich typów. **Doctrine** potrafi zwrócić w kolekcji
   wszystkie dziedziczone typy.
-  Relacja jest zdefiniowana w pluginie. Mniej kopiowania z **README**
-  Jeśli komuś wystarczy podstawowy model profilu, nie będzie musiał w
   ogóle ruszać swojego pliku **schema.yml**.

Wersja 1.3.0 sfForkedDoctrineApply wraz z wszelkimi poprawkami powinna
się ukazać w ciągu dwóch tygodni. Jeśli ktoś ma ochotę sprawdzić
działanie już teraz, kod źródłowy może pobrać z dwóch gałęzi
repozytorium git:
`master <http://github.com/fizyk/sfForkedDoctrineApplyPlugin>`_ -
zawierającą ostatni najświeższy kod pluginu i
`column\_aggregation <http://github.com/fizyk/sfForkedDoctrineApplyPlugin/tree/column_aggregation>`_
zawierający ostatni kod dotyczący opisanej tutaj zmiany.
