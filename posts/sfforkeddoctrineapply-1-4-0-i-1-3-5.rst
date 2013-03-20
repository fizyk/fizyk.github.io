.. title: sfForkedDoctrineApply 1.4.0 i 1.3.5
.. slug: sfforkeddoctrineapply-1-4-0-i-1-3-5
.. date: 2010/10/18 21:10:20
.. tags: symfony, sfForkedDoctrineApply, php, sfDoctrineGuard, aktualizacja
.. link:
.. description: Przed chwilą umieściłem w kanale pear pluginów symfony paczki z nowymi wersjami pluginów sfForkedDoctrineApply w wersjach 1.4.0 i 1.3.5. O ile wersja 1.3.5 wnosi tylko parę drobnych poprawek, o tyle wersja 1.4.0 to już duży krok naprzód, głownie ze względu na fakt współpracy z sfDoctrineGuard 5.0.

Przed chwilą umieściłem w kanale pear pluginów symfony paczki z nowymi
wersjami pluginów sfForkedDoctrineApply w wersjach 1.4.0 i 1.3.5. O ile
wersja 1.3.5 wnosi tylko parę drobnych poprawek, o tyle wersja 1.4.0 to
już duży krok naprzód, głownie ze względu na fakt współpracy z
**sfDoctrineGuard 5.0**.

Zmiany w wersji **1.3.5**:

-  zalogowany użytkownik zostanie automatycznie przekierowany ze strony
   rejestracji na stronę ustawień (`GitHub
   26 <http://github.com/fizyk/sfForkedDoctrineApplyPlugin/issues/closed#issue/26>`_)
-  w przypadku użycia dziedziczenia, pole typu zostanie wyłączone
   (`GitHub
   25 <http://github.com/fizyk/sfForkedDoctrineApplyPlugin/issues/closed#issue/25>`_)
-  formularze ustawień i rejestracji akceptują przesyłanie plików
   (`GitHub
   27 <http://github.com/fizyk/sfForkedDoctrineApplyPlugin/issues/closed#issue/27>`_)

Zmiany w wersji **1.4.0**:

-  największą zmianą jest zmiana definicji klucza obcego do modelu
   `sfDoctrineUserGuard <http://www.symfony-project.org/plugins/sfDoctrineGuardPlugin>`_.
   z **int(4)** do **int(8)**. Od teraz plugin działa z sfDoctrineGuard
   w wersji 5.x.
-  W ramach aktualizacji pola email w profilu zostaje aktualizowane pole
   w obiekcie użytkownika.
-  Dołączony został task, umożliwiający automatyczne skopiowanie adresu
   email z profilu do obiektu użytkownika.
-  Wszystkie zmiany z wersji 1.3.5 i poprzednich.

Teraz parę słów odnośnie adresów email. W kolejnej wersji
sfForkedDoctrineApply (1.5), pole przechowujące podstawowy adres email
zostanie usunięte z modelu profilu, a wykorzystane zostanie tylko to z
obiektu użytkownika. Ma to sens, ponieważ i tak jest on głównie używany
głównie w kontekście logowania, gdzie podajemy albo nazwę użytkownika,
albo adres e-mail. A ponieważ pole zostało już dodane do modelu
użytkownika, więc czemu nie skorzystać z niego. 

Pole przechowujące nowy adres email przed jego akceptacją pozostanie
oczywiście w profilu.

Instalacja od nowa jest łatwiejsza, jednak aktualizacja istniejących
projektów może być "trochę" skomplikowana. Jeśli nie potrzebujecie
czegoś, co występuje tylko w nowych wersjach sfDoctrineGuard lub
sfForkedDoctrineApply, na pewno macie coś lepszego do zrobienia.

Plugin, jak zwykle, znajduje się na stronach symfony:
`sfForkedDoctrineApplyPlugin <http://www.symfony-project.org/plugins/sfForkedDoctrineApplyPlugin>`_.
