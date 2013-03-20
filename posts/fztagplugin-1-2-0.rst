.. title: fzTagPlugin 1.2.0
.. slug: fztagplugin-1-2-0
.. date: 2010/11/21 21:11:23
.. tags: symfony, fzTag, php, jQuery, tag cloud
.. link:
.. description: Po sporej przerwie od poprzedniej wersji i okresie rozwijania zaplanowanych funkcjonalności, z przyjemnością przedstawiam nową wersje pluginu fzTag dla symfony. W menu tym razem chmury tagów i ilość użycia.

Po sporej przerwie od poprzedniej wersji i okresie rozwijania
zaplanowanych funkcjonalności, z przyjemnością przedstawiam nową wersje
pluginu fzTag dla `symfony <http://www.symfony-project.org/>`_. W menu
tym razem chmury tagów i ilość użycia.

Plugin ten to przede wszystkim zliczanie wagi tagów, ilości użyć. Użycia
te są zliczane dla wszystkich modeli. Dodatkowo moduł frontendowy został
wzbogacony o listę, stronę tagów (którą trzeba dostosować do aplikacji
jednak) a także trzy komponenty chmury tagów.

Lista zmian:

-   zliczanie użycia tagów
-  task do przeliczenia użycia tagów od początku
-  akcje index (lista tagów) i show (strona tagu) w module fzTag
-  ścieżki fz\_tag i fz\_tag\_show dla powyższych modułów
-  trzy komponenty chmury tagów:

   -  podstawowy - do dostosowania
   -  3dTagCloud - generujący kule z tagami za pomocą pluginu jQuery
      `jquery.tagsphere <http://bitbucket.org/elbeanio/jquery.tagsphere/wiki/Home>`_
   -  canvasTagCloud - generujący kulę tagów z pomocą elementu html5
      canvas i pluginu jQuery
      `TagCanvas <http://www.goat1000.com/tagcanvas.php>`_, zapewnia
      płynniejszą animację niż 3dTagCloud, ale problematyczne jest
      stylowanie.

Oprócz tego mnóstwo mniejszych zmian, które można podejrzeć na
`Githubie <https://github.com/fizyk/fzTagPlugin/compare/1.1.1...1.2.0>`_.

-  Jak zwykle, plugin można zdobyć na trzy sposoby, uruchamiając taska
   symfony:

   ::

       ./symfony plugin:upgrade fzTagPlugin

-  Ze stron
   symfony: \ `http://www.symfony-project.org/plugins/fzTagPlugin/1\_2\_0 <http://www.symfony-project.org/plugins/fzTagPlugin/1_2_0>`_
-  Z repozytorium pluginu na
   githubie: \ `https://github.com/fizyk/fzTagPlugin/tree/1.2.0 <https://github.com/fizyk/fzTagPlugin/tree/1.2.0>`_

