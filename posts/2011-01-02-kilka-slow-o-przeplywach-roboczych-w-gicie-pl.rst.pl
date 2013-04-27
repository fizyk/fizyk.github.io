.. title: Kilka słów o przepływach roboczych w gicie
.. slug: kilka-slow-o-przeplywach-roboczych-w-gicie-pl
.. date: 2011/01/02 19:01:02
.. tags: git, vcs
.. link:
.. description: Dość dawno temu napisałem tekst o podstawowych poleceniach gita. Teraz postanowiłem napisać trochę o przepływach roboczych w gicie: przepływ z repozytorium centralne, przepływ z repozytorium rozproszonym a na koniec parę słów o repozytorium samodzielnym.

Dość dawno temu napisałem tekst o `podstawowych poleceniach
gita <http://blog.fizyk.net.pl/pl/blog/git-a-inne-systemy-kontroli-wersji-svn-i-bzr.html>`_.
Teraz postanowiłem napisać trochę o przepływach roboczych w gicie:
przepływ z repozytorium centralne, przepływ z repozytorium rozproszonym
a na koniec parę słów o repozytorium samodzielnym.

.. TEASER_END

Przepływ scentralizowany.
-------------------------

Schemat z centralnym repozytorium można stosować w każdym z omówionych
systemów kontroli wersji. Co prawda ani w bazaarze, ani w gicie nie jest
to obowiązkowy, ale niekiedy przydatny schemat.

W schemacie scentralizowanym deweloperzy kommitują zmiany w swoim
lokalnym repozytorium, ściągają aktualną wersję modyfikowanej gałęzi z
centralnego repozytorium, a następnie pushują swoje modyfikacje do tej
gałęzi na centralnym repozytorium. W praktyce ten schemat nie różni się
praktycznie niczym od tego stosowanego w Subversion, za wyjątkiem
możliwości pracy z repozytorium offline, w końcu każdy developer ma
jeszcze swoje własne repozytorium.

Przepływ rozproszony.
---------------------

Przepływ rozproszony jest bardziej skomplikowany. Nie ma tutaj serwera
centralnego i nie wykonuje się pusha na żadne repozytorium. Przepływ
przeważnie wygląda tak:

-  aktualizowanie zmian dokonanych przez innego developera za pomocą
   pull'a
-  dokonywanie zmian i komitowanie ich lokalnie
-  ewentualny rebase (np. połączenie kilku komitów w jeden)
-  poinformowanie innych o zakończeniu pracy - wtedy pozostali
   dveloperzy mogą ściągnąć działające zmiany

Dobrym rozwiązaniem byłoby pracowanie lokalnie na jednej gałęzi, a po
skończeniu jakiegoś etapu udostępnić na innej z której reszta zespołu
pobierze zmiany.

Repozytorium produkcyjne.
-------------------------

Ważnym elementem projektów, szczególnie webowych jest wersja
produkcyjna. Niektóre frameworki posiadają swoje rozwiązania na
umieszczanie kodu na serwerze produkcyjnym, jednak równie wygodnym
rozwiązaniem może być potraktowanie go jako kolejnego repozytorium.
Tylko jedna uwaga. Git raczej nie pozwala pushować do repozytorium na
aktualnie wybraną gałąź w drzewie roboczym, dlatego nie należy używać
repozytorium produkcyjnego jako repozytorium centralnego. Należy raczej
ściągnąć na to repozytorium aktualną wersję z wybranego drzewa z
repozytorium centralnego. Dodatkowym plusem tego jest możliwość
odpalenia wszelkich zakodowanych czynności na serwerze produkcyjnym jak
np. migracja bazy.

Praca samodzielna.
~~~~~~~~~~~~~~~~~~

Można się zastanowić, po co repozytorium dla projektu realizowanego
przez jedną osobę? Po pierwsze, zespół może urosnąć, a po drugie,
stanowi ono wygodną historię wszystkich zmian umożliwiającą wycofanie
konkretnego zestawu zmian. Nie trzeba sobie potem przypominać, co
jeszcze się w danym momencie zmieniało. Wystarczy wycofać zmiany z
poziomu systemu kontroli wersji.
