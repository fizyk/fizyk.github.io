.. title: Ubuntu 10.4 Lucid Lynx - pierwsze wrażenia
.. slug: ubuntu-aa-4-lucid-lynx-pierwsze-wrazenia
.. date: 2010/05/01 18:05:29
.. tags: ubuntu, system operacyjny, instalacja
.. link:
.. description: Tak się zdarzyło, iż wczoraj swoją premierę miała kolejna wersja Ubuntu, oznaczona numerem 10.4 o dźwięcznej nazwie Lucid Lynx. Przekładając na polski to jasny, przejrzysty lub czytelny Ryś (pozdrowienia dla Ojca). Oczywiście od razu nastawiłem torrenty z wersją biurkową, a po powrocie z pracy, zacząłem sprawdzać zachowanie na komputerach.

Tak się zdarzyło, iż wczoraj swoją premierę miała kolejna wersja Ubuntu,
oznaczona numerem 10.4 o dźwięcznej nazwie Lucid Lynx. Przekładając na
polski to jasny, przejrzysty lub czytelny Ryś (pozdrowienia dla Ojca).
Oczywiście od razu nastawiłem torrenty z wersją biurkową, a po powrocie
z pracy, zacząłem sprawdzać zachowanie na komputerach.

Instalacja
~~~~~~~~~~

Pierwszy komputer, który potraktowałem Rysiem to używany przez siostrę
Dell GX280, który zatrzymał się na wersji 9.4 Ubuntu (I dobrze, biorąc
pod uwagę problemy 9.10 z partycjami vfat). Stwierdziłem, że wszystko
działa (w testowanej poprzednio 10.4 beta 2 live, brak było dźwięku),
poprawiłem najpierw rozkład partycji za pomocą gparted, a następnie
przystąpiłem do instalacji Ubuntu. Mogę powiedzieć, że była to sama
przyjemność. System po instalacji wstał poniżej 20 sekund do ekranu
logowania. Używając jednego z dwóch ostatnich (nowoczesnych) systemów
Microsoftu można by pomarzyć, a następnie kilkakrotnie pomnożyć. Samo
działanie również przebiega w miarę sprawnie.

Drugi komputer, który wziąłem w obroty, to mój własny laptop - Samsung
R510. Podczas instalacji napotkałem jeden "drobny" problem. Przygotowany
pod 9.10 dysk USB Live z Rysiem posiadał uszkodzone pliki, w związku z
czym instalacja była przerywana na 41% postępu z informacją o tym, iż
albo system live jest uszkodzony, albo mój dysk. Na szczęście na drugim
dysku usb miałem jeszcze obraz, i mogłem przygotować "dysk
uruchomieniowy" ponownie z użyciem pierwszego pendriva. Od tego momentu
dalej poszło wszystko sprawnie. Nie zmierzyłem jeszcze tylko czasu
wstawania systemu.

Pierwsze wrażenia
~~~~~~~~~~~~~~~~~

Po uruchomieniu i zalogowaniu się do ubuntu wita nas nowy wgląd (pod
warunkiem, że to nowe konto, inaczej, trzeba poprawić w ustawieniach
wyglądu systemu), nazwany **Ambience**. Temat jest utrzymany w ciemnych
kolorach i kiedyś byłbym szczęśliwy mając taki wystrój systemu. Dzisiaj
jednak wolę jaśniejsze kolory, i dlatego przełączyłem na temat
**Radiance**. Ponieważ była to czysta instalacja jeszcze parę rzeczy
muszę doinstalować, kilka innych (applety gnoma) zostało wykrzyczanych
przez system. Z tego, co oprócz wyglądu zauważyłem, to: 

-  kolejna wersja Centrum Oprogramowania Ubuntu, która wygląda o niebo
   lepiej od poprzedniej, choć mam wrażenie, że działające Centrum do
   dość spore obciążenie dla systemu.
-  Niemiłą dla mnie niespodzianką jest aktualizacja audaciousa do wersji
   2.3. Brak w niej scrobblera, a także skórek. Tak więc czas się
   pożegnać już z czymś co przypomina winampa z Windowsa (którego w
   zamierzchłych czasach używałem). Przeniosę się na stałe na Banshee,
   lub Rhythmboxa. Przynajmniej applet Media Control z `Avant Window
   Navigatora <https://launchpad.net/awn>`_ lepiej z nimi współpracuje.
-  php zostało zaktualizowane do wersji 5.3! Będę miał się gdzie pobawić
   symfony 2.0 za jakiś czas, o samych usprawnieniach w php nie
   wspominając.
-  Palimpsest (Narzędzie do obsługi dysków) otrzymał zretuszowany
   interfejs. Jest bardziej czytelne.
-  Ikonki w nowej wersji Ubuntu są również dopasowane, chociaż tutaj
   retusz co pół roku nie jest dokładnie w moim guście ;)

Pewnie więcej rzeczy wyjdzie w praniu, teraz muszę sobie przypomnieć
czego to ja ostatnio używałem i zainstalować ponownie. Nowe ubuntu można
pobrać ze `strony oficjalnej <http://www.ubuntu.com/>`_ oczywiście, choć
polecam użycie opcji pobrania poprzez
`torrenty <http://www.ubuntu.com/getubuntu/downloadmirrors#bt>`_, sieć
p2p (Opera ma wbudowaną obsługę torrentów).
