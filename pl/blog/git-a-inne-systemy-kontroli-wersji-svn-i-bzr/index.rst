.. title: Git a inne systemy kontroli wersji (svn i bzr)
.. slug: git-a-inne-systemy-kontroli-wersji-svn-i-bzr
.. date: 2010/11/06 16:11:16
.. tags: git, subversion, bazaar, vcs
.. link:
.. description: Miałem okazję zapoznać się z trzema systemami kontroli wersji, Subversion, Bazaar i git (w tej kolejności). Każdy ma swoje wady i zalety, jednak ze wszystkich trzech dla mnie git jest najwygodniejszy i najsprawniejszy.

Miałem okazję zapoznać się z trzema systemami kontroli wersji,
**Subversion**, **Bazaar** i **git** (w tej kolejności). Każdy ma swoje
wady i zalety, jednak ze wszystkich trzech dla mnie git jest
najwygodniejszy i najsprawniejszy. Tak jak z Subversion, czy później z
Bazaarem, tak i z gitem miałem początkowo problem by płynnie korzystać z
jego możliwości, ale wygoda rośnie w miarę używania. Dla swojej (i być
może innych) wygody, postaram się tutaj przybliżyć podstawowe komendy
git'a a także odpowiedniki w dwóch pozostałych systemach kontroli
wersji.

.. TEASER_END

Ale najpierw zacznę od paru zdań na temat różnic pomiędzy oboma
systemami. Czym różnią się od siebie te systemy?

-  `Subversion <http://subversion.apache.org/>`_, popularny svn jest
   scentralizowanym system. Zmiany zapisujemy w centralnym miejscu, ale
   zanim to zrobimy, musimy zaktualizować nasze drzewo robocze i
   rozwiązać konflikty. Perspektywa nieco przerażająca. Efektem tego
   jest praktycznie brak atomowych commitów, które zastępowane są przez
   zbiorcze zmiany (np. raz dziennie). Oczywiście nawet to jest
   niemożliwe, gdy repozytorium jest niedostępne.
-  `Bazaar <http://bazaar.canonical.com/>`_, popularyzowany przez
   `Canonical <http://www.canonical.com/>`_ i jego platformę
   `Launchpad <https://launchpad.net/>`_. Jest to już zdecentralizowany
   system kontroli wersji. Można spokojnie commitować tak zwane atomowe
   zmiany i robić w swoim własnym repozytorium, bez połączenia z
   centralnym. Tutaj każde repozytorium jest osobną gałęzią pomiędzy
   którymi możemy przenosić zmiany, łącznie z historią zmian (push &
   merge). Z własnego doświadczenia wiem jedno, jest wolny. Wolniejszy,
   jeśli używać jeszcze programu GUI (np. *Bazaar Explorer*).
-  A git? `Git <http://git-scm.com/>`_ podobnie jak Bazaar jest
   zdecentralizowanym repozytorium. Brakuje nawet jako takiego
   centralnego repozytorium, choć taka architektura projektu na gicie
   również jest możliwa. Każde repozytorium jest jednocześnie kontenerem
   gałęzi, a przełączając się pomiędzy gałęziami, zmienia się struktura
   plików fizycznych na odpowiadające tym, z aktualnie używanej gałęzi.
   W projektach zauważyłem jeszcze jedno: jest szybki. Według różnych
   informacji tzw. zasłyszanych, nie jest wcale szybki pod Windowsem,
   ale... osobiście nie używam Windowsa do pracy (chyba, tylko po to, by
   skorzystać z Corela).

Również do commitów (zapisów zmian) te trzy systemy podchodzą różnie. O
ile dobrze pamiętam, w commitach svn wszystkie zmiany są dołączane
automatycznie, podobnie jest w bazaarze. Zmiany te można pominąć.
Natomiast git wymaga od nas zadeklarowania zmian, które chcemy załączyć,
czy to jest dodawanie, zmienianie, czy usuwanie plików. Bywa to męczące
przy dużej ilości zmian, ale z drugiej strony, urokiem repozytoriów
rozproszonych takich jak Bazaar, czy git, są właśnie atomowe commity, a
nie zbiorcze jak w Subversion.

W gicie można wyróżnić sześć podstawowych operacji umożliwiających
przenoszenie zmian pomiędzy drzewami i repozytoriami.

git init
^^^^^^^^

Polecenie to tworzy nowe repozytorium. Odpowiednikiem tego polecenia w
Bazarze jest bzr init (o ile mnie pamięć nie myli), a w Subversion...
Subversion inicjuje się na centralnym serwerze, a lokalnie ściąga
aktualną wersję za pomocą svn checkout.

git clone
^^^^^^^^^

Umożliwia utworzenie lokalnej kopii innego repozytorium. Polecenie to
inicjuje repozytorium git we wskazanym miejscu i ściaga historię zmian z
danego repozytorium "zdalnego". Odpowiednikiem w Bazarze jest bzr branch
- jako, że w bazarze każde repozytorium to osobna gałąź, a w Subversion
- svn checkout - kopiuje aktualną wersję kodu do wskazanego miejsca.

git merge
^^^^^^^^^

To polecenie służy to łączenia zmian z różnych gałęzi. Odpowiednikiem
Bazaara jest bzr merge, z tym, że w bazaarze każde repozytorium jest
gałęzią, natomiast Subversion... nie używałem go na tyle długo i
dogłębnie, by zapamiętać. Chociaż pamiętam próbę tworzenia "gałęzi" w
repozytorium svn.

git fetch
^^^^^^^^^

To polecenie służy do ściągnięcia informacji o stanie zdalnego
repozytorium. Dzięki temu git może wyświetlić porównanie pomiędzy
repozytorium lokalnym, a zdalnym, ile różnych zmian posiada każde z
repozytoriów, i czy łączenie przebiegnie bezboleśnie. Odpowiedników z
Bazaara brak, w Subversion tym bardziej.

git pull
^^^^^^^^

Służy do ściągania zmian z repozytorium zdalnego z konkretnej gałęzi.
Odpowiednikiem w Bazaarze jest podobnie bzr merge, a w Subversion svn
update/svn checkout.

git push
^^^^^^^^

Ostatnie z poleceń jest przydatne w przypadku scentralizowanej struktury
repozytoriów. Służy ono do "popchnięcia" zmian z określonej gałęzi
repozytorium lokalnego, na określoną gałąź repozytorium zdalnego (i
ewentualne utworzenie gałęzi). git push umożliwia również popchnięcie
tagów. Odpowiednikiem w Bazaarze jest bzr push, natomiast Subversion
takiego odpowiednika nie posiada.
