.. title: sfForkedDoctrineApply w wersji 1.2.0
.. slug: sfforkeddoctrineapply-w-wersji-1-2-0
.. date: 2010/05/06 20:05:58
.. tags: symfony, plugin
.. link:
.. description: Wczoraj wypuściłem sfForkedDoctrineApply w wersji 1.2.0. Z jednodniowym opóźnieniem, które zostało spowodowane pewną niedogodnością oryginalnej konstrukcji akcji modułu sfApply z sfDoctrineApply.

Wczoraj wypuściłem
`sfForkedDoctrineApply <http://www.symfony-project.org/plugins/sfForkedDoctrineApplyPlugin>`_
w wersji 1.2.0. Z jednodniowym opóźnieniem, które zostało spowodowane
pewną niedogodnością oryginalnej konstrukcji akcji modułu sfApply z
sfDoctrineApply.

.. TEASER_END

Z większych zmian, to została dodana możliwość edycji adresów email dla
profili. Oczywiście, tylko, jeśli deweloper zezwoli na takie posunięcie.
Służy do tego ustawienie **app\_sfForkedApply\_mail\_editable**.
Początkowo chciałem dołączyć możliwość do edycji samego profilu i
stworzyłem validator, który sprawdza pomija w sprawdzaniu unikalności
adresu profil jego właściciela, tak by nie zwracał błędu przy braku
zmiany adresu. Po zmianie koncepcji na osobny formularz, jest on
teoretycznie nie potrzebny, jednak gdyby ktoś chciał dołączyć edycję
adresu e-mail do profilu, będzie jak znalazł.

Przy okazji poprawiłem przetwarzanie formularzy, teraz rozszerzając je,
będzie można bez problemów zmienić im nazwę, oraz poprawiłem jedną
niezbyt szczęśliwą konstrukcję, gdy podczas testowania wysyłania
e-maila, deweloper otrzymywał komunikat o błędzie podczas procesu, bez
żadnych dodatkowych wyjaśnień. Teraz otrzyma "ładną", standardową stronę
z wyjątkiem. Efekt uzyskany dzięki ponownemu wyrzuceniu wyjątku w
środowisku deweloperskim.

Plugin znajduje się w `repozytorium pluginów
symfony <http://www.symfony-project.org/plugins/sfForkedDoctrineApplyPlugin>`_,
repozytirum kodem znajduje się na
`githubie <http://github.com/fizyk/sfForkedDoctrineApplyPlugin>`_, gdzie
można również zgłaszać
`błędy <http://github.com/fizyk/sfForkedDoctrineApplyPlugin/issues>`_.
