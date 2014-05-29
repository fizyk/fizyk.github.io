.. title: sfForkedDoctrineApply w wersji 1.3.0 (1.3.1)
.. slug: sfforkeddoctrineapply-w-wersji-1-3-0-1-3-1
.. date: 2010/07/22 23:07:03
.. tags: symfony, sfForkedDoctrineApply, php, sfDoctrineGuard
.. link:
.. description: Plugin sfForkedDoctrineApply został zaktualizowany do wersji 1.3 (aktualnie 1.3.1). Główną zmianą w gałęzi 1.3 jest zmiana modelu dziedziczenia opisana wcześniej, przed wydaniem pluginu z tej gałęzi.

Plugin **sfForkedDoctrineApply** został zaktualizowany do wersji 1.3
(aktualnie
`1.3.1 <http://www.symfony-project.org/plugins/sfForkedDoctrineApplyPlugin/1_3_1>`_).
Główną zmianą w gałęzi 1.3 jest zmiana modelu dziedziczenia opisana
wcześniej, przed wydaniem pluginu z tej gałęzi.

.. TEASER_END

Pozostałe zmiany, o których jeszcze nie pisałem to:

-  Task, który wyczyści stare, nieużyte kody walidacyjne -
   **sfForkedDoctrineApply:clear-validation-codes**. Jako parametr
   przyjmuje liczbę w dniach, usuwając tym samym kody starsze, niż
   zadana liczba dni.
-  Zmienione wymagania dotyczące formularzy do aplikacji i ustawień. Od
   wersji 1.3, muszą one dziedziczyć po sfGuardUserProfileForm, a nie
   odpowiednio po sfApplyApplyForm, czy sfApplySettingsForm.
-  Na pole user\_id został nałożony indeks typu unique, który ma
   dodatkowo zapewnić zachowanie faktu posiadania jednego profilu przez
   jednego użytkownika.

W wersji 1.3.1 oprócz poprawienia paru dość istotnych pomyłek w kodzie
związanych z ustawianiem kodów walidacyjnych, została przeniesiona z
gałęzi 1.2 (od wersji 1.2.5) zmiana dotycząca wiadomości
potwierdzających. Od teraz można włączyć wiadomości takie dla zmiany
hasła przez użytkownika zalogowanego.

Przy okazji wydania nowej wersji **sfDoctrineGuard** (5.0), miało pewne
zamieszanie, przez które o mało co nie wstrzymałem się z wydaniem nowego
**sfForkedDoctrineApply**. Na szczęście paczki zostały poprawione, a na
`githubie <http://github.com/fizyk/sfForkedDoctrineApplyPlugin/tree/for_sfDoctrineGuard5>`_
utworzyłem nową gałąź kompatybilną z definicjami modeli nowego
sfDoctrineGuard. Teraz wysiłek developerski będzie dotyczył pełnego
przystosowania sfForked do nowego sfDoctrineGuard.
