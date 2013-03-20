.. title: sfForkedDoctrineApply w wersji 1.5
.. slug: sfforkeddoctrineapply-w-wersji-1-5
.. date: 2010/11/23 21:11:43
.. tags: symfony, plugin, sfForkedDoctrineApply, php, sfDoctrineGuard
.. link:
.. description: Dzisiaj wypuściłem nową wersję sfForkedDoctrineApply. W porównaniu do poprzedniej, zmiany są niewielkie, ale istotne.

Dzisiaj wypuściłem nową wersję sfForkedDoctrineApply. W porównaniu do
poprzedniej, zmiany są niewielkie, ale istotne.

Od tej wersji plugin zrzuca pole email profilu, i zaczyna używać adres
email przechowywany w obiekcie użytkownika. W 1.4 tylko go aktualizował.

.. important::

    Przed aktualizacją do 1.5, należy najpierw zaktualizować do 1.4 i uruchomić dołączonego w niej taska **sfForkedDoctrineApply:upgrade-proiles**. W wersji 1.5 jest on już niedostępny, a dodatkowo, nie ma już z czego przenosić.

Plugin, jak zwykle do zdobycia w następujący sposób:

-  na stronach symfony:
   `http://www.symfony-project.org/plugins/sfForkedDoctrineApplyPlugin/1\_5\_0 <http://www.symfony-project.org/plugins/sfForkedDoctrineApplyPlugin/1_5_0>`_
-  na
   githubie: \ `https://github.com/fizyk/sfForkedDoctrineApplyPlugin/tree/1.5.0 <https://github.com/fizyk/sfForkedDoctrineApplyPlugin/tree/1.5.0>`_
-  a także w samym symfony poprzez task **plugin:upgrade**

`Lista
zmian <https://github.com/fizyk/sfForkedDoctrineApplyPlugin/compare/1.4.1...1.5.0>`_.
