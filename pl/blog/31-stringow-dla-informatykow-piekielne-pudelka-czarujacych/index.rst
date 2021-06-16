.. title: 31 stringów dla informatyków, piekielne pudełka czarujących
.. slug: 31-stringow-dla-informatykow-piekielne-pudelka-czarujacych
.. date: 2010/03/15 21:03:56
.. tags: strona, symfony, i18n, xliff, virtaal, ckeditor
.. link:
.. description: Tyle ciągów znaków do przetłumaczenia znalazłem w module sfApply. Generalnie procedura wydobycia ich jest niemal prosta, wystarczy wykonać  olecenie: *./symfony i18n:extract nazwa\_aplikacji*

Tyle ciągów znaków do przetłumaczenia znalazłem w module **sfApply**. Generalnie procedura wydobycia ich jest niemal prosta, wystarczy wykonać polecenie:

.. code-block:: bash

    ./symfony i18n:extract nazwa\_aplikacji*

.. TEASER_END

i gotowe. Plik w formacie `xliff <http://en.wikipedia.org/wiki/XLIFF>`_ z rozszerzeniem xml pojawia się w katalogu i18n danej aplikacji.

Wszystko było dobrze, gdyby jeszcze sprawdzał dopuszczone w aplikacji moduły z pluginów. Niestety, nie sprawdza. Na szczęście da się to załatwić szybkim przenieś i ponownym wykonaniem polecenia.

I tutaj napotkałem kolejny problem. Otóż w celu ułatwienia sobie tłumaczenia stringów w module sfApply, zainstalowałem sobie program `Virtaal <http://translate.sourceforge.net/wiki/virtaal/index>`_. Obsługuje całe mnóstwo formatów językowych, co może być przydatne patrząc, jakie są wykorzystane w samym symfony. Jest tylko mały szkopuł.

Rozszerzenie generowanego przez task **i18n:extract** pliku to **.xml**, rozszerzenie formatu to **.xlf**, a Virtaal rozpoznaje format po rozszerzeniu. Zmiana rozszerzenia na potrzeby tłumaczenia wymaga późniejszej zmiany z powrotem do .xml na potrzeby symfony. Bug w Virtaal, czy bug w symfony?

W każdym razie uruchomienie rejestracji coraz bliżej, razem z komentarzami. A dodatkowo w weekend zmieniłem sobie edytor z `TinyMCE <http://tinymce.moxiecode.com/>`_ na `CKeditor <http://ckeditor.com/>`_.
