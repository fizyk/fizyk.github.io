.. title: Migracje z behaviourem generującym dodatkowe modele
.. slug: migracje-z-behaviourem-generujacym-dodatkowe-modele
.. date: 2010/04/06 23:04:11
.. tags: symfony, doctrine, migracje, toprfx, diem
.. link:
.. description: W firmie postanowiliśmy wykorzystać migracje. Przeważnie tworzy je się dość prosto, i prosto migruje się bazę danych do kolejnych wersji. Jednym z wyjątków jest użycie behavioura generującego dodatkowe modele i tabele bazy danych. Otrzymujemy wtedy następujący błąd:

W firmie postanowiliśmy wykorzystać migracje. Przeważnie tworzy je się
dość prosto, i prosto migruje się bazę danych do kolejnych wersji.
Jednym z wyjątków jest użycie behavioura generującego dodatkowe modele i
tabele bazy danych. Otrzymujemy wtedy następujący błąd:

    **Fatal error**: Class BaseToPrfx\* could not be found...

.. TEASER_END

Skąd ten błąd się bierze? Otóż wykonując zadanie
**doctrine:generate-migrations-diff**, Doctrine tworzy pomocnicze modele
używając dodatkowego prefiksu ToPrfx. W momencie wystąpienia błędu,
wszystkie klasy ToPrfx są stworzone, łącznie z **BaseToPrfx\***. Jednak
klasa Base, nie zostaje załadowana po utworzeniu, co powoduje nasz błąd.

Jak problem rozwiązać? Rozwiązanie jest dość banalne. Otóż wystarczy
uruchomić zadanie **doctrine:generate-migrations-diff** dwukrotnie. W
przypadku użycia diem, należy wyczyścić cache pomiędzy kolejnymi
uruchomieniami polecenia diff za pomocą **cache:clear**
(**dm:clear-cache** niewiele pomoże).

Drugie uruchomienie taska utworzy bezproblemowo migracje, choć nie bez
problemów w środku. Otóż polecenia dodające nasze nowe tabele znajdą się
w metodzie **down()**, a te usuwające w metodzie **up()**. łatwo
zauważyć, że nie oto chodzi, a naprawa tego, to proste Kopiuj i Wklej.
Niestety, od tej pory czeka nas kilka problemów.

-  Po pierwsze, od tej pory, dwukrotne uruchomienie migracji będzie
   wymagane za każdym razem, by otrzymać nasze migracje. I za każdym
   razem w klasach migracyjnych znajdą się polecenia usuwające i
   tworzące tabele dla generowanych z behavioura modeli.
-  Po drugie, podczas generacji migracji, modele dla tych dodatkowych
   tabel zostaną i tak usunięte, więc bez systemu kontroli wersji,
   napotkamy kolejny problem.

Dlatego należy zadać sobie ważne pytanie:
 Czy potrzebujemy modeli wygenerowanych przez behaviour tabel?

Należy rozważyć wszelkie za i przeciw, ale osobiście zalecam rezygnację,
przynajmniej do czasu poprawy błędu w
`symfony <http://trac.symfony-project.org/ticket/8491>`_. Chyba, że te
modele są potrzebne i używamy systemu kontroli wersji, lub potrzebujemy
powodu do nauki tworzenia klas migracyjnych.

Nasze podejście w zespołach do migracji jest częściowo wymuszone poprzez
użycie systemu `CMF diem <http://diem-project.org/>`_, a częściowo jest
to spowodowane względami praktycznymi. Robiąc migrację teraz, trudniej
będzie o nich zapomnieć później, gdy projekt zacznie działać.
