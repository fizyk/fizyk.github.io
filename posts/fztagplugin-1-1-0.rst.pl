.. title: fzTagPlugin 1.1.0
.. slug: fztagplugin-1-1-0
.. date: 2010/08/12 18:08:27
.. tags: symfony, fzTag, php
.. link:
.. description: Po długim oczekiwaniu znalazłem chwilkę, by wprowadzić część zmian do fzTagPlugin.

Po długim oczekiwaniu znalazłem chwilkę, by wprowadzić część zmian do
fzTagPlugin.

Główne zmiany, które dotknęły plugin to:

-  moduł administracyjny
-  dołączanie widgetu autocomplete tylko w momencie gdy:

   -  aplikacja posiada moduł **fzTagAutocomplete** (a tym samym
      ścieżkę)
   -  formularz posiada pole '**tags\_list**\ '.

Poza tym, plik css dla
`fcbkcomplete <http://github.com/emposha/FCBKcomplete>`_ został
zaktualizowany, by zawierać ostatnie zmiany wprowadzone przez emposhę
oraz moje modyfikacje. Zaktualizowany został plik README, oraz polskie
tłumaczenie.

Plugin można znaleźć i pobrać na stronach
`symfony <http://www.symfony-project.org/plugins/fzTagPlugin>`_ oraz
`github <http://github.com/fizyk/fzTagPlugin>`_.
