.. title: Doctrine Inheritance Hell
.. slug: doctrine-inheritance-hell
.. date: 2010/03/08 22:03:53
.. tags: symfony, doctrine, inheritance, apostrophe, sfDoctrineApply
.. link:
.. description: W poprzednią środę rozpocząłem pracę, jako programista aplikacji webowych (framework symfony), ale nie zapominam o innych rzeczach.

W poprzednią środę rozpocząłem pracę, jako programista aplikacji
webowych (framework symfony), ale nie zapominam o innych rzeczach.

.. TEASER_END

Aktualnie w domu pracuję głównie nad forkiem pluginu
`sfDoctrineApplyPlugin <http://www.symfony-project.org/plugins/sfDoctrineApplyPlugin>`_.
Doszedłem do wniosku, ze póki co, sfGuardUserProfile nie będzie
dziedziczył po obiekcie sfGuardUser z pluginu
`sfDoctrineGuardPlugin <http://www.symfony-project.org/plugins/sfDoctrineGuardPlugin>`_.
Wymagałoby to zbyt wielu zmian w strukturze i różnic w architekturze.
Przede wszystkim, przy próbie zastosowania dziedziczenia typu
**concrete**, konieczne byłoby zmodyfikowanie modeli dostarczanych przez
ten plugin: sfGuardUser, sfGuardPermission i sfGuardGroup. Skończyłoby
się łączeniem obu tych pluginów w jednym miejscu. I jakkolwiek opcja
jest kusząca, gdyż powinna rozwiązać kilka problemów, sam tego na razie
nie zrobię. Dziedziczenie concrete byłoby wymagane, by można było
przynajmniej część dodatkowych kolumn ustawić jako wymagane. Nie jest to
możliwe przy zastosowaniu dziedziczenia typu **simple** lub
**column\_aggregation**.

Zamiast wciągać w modyfikacje plugin sfDoctrineGuard, zdecydowałem się
na zaproponowanie dziedziczenia po profilu z dwóch powodów:

Po pierwsze, sfDoctrineGuard dostarcza gotową część funkcjonalności:
umożliwia logowanie i wylogowywanie użytkowników, zarządzanie grupami i
uprawnieniami. W pewnych przypadkach to wystarczy, szczególnie w
systemach, gdzie nowych użytkowników rejestruje administrator, lub osoba
wyznaczona. sfDoctrineApply dostarcza funkcjonalności wymaganych do
pełnej obsługi samodzielnej rejestracji, a jego dwie główne wady to
zależność od Zend Framework i jedno pole na imię i nazwisko.

Z całym szacunkiem do twórców apostrophe, możliwe, że u nich odzięcie
się od SwiftMailer minimalizuje zależności. W innych przypadkach taki
krok tylko zwiększa ilość zależności. Tym bardziej, iż aby skorzystać z
Zend\_Mail raczej konieczne jest użycie co najmniej minimalnej wersji
Zend Framework. Taki krok zwiększa tylko wagę projektu o dodatkowe 20MB!
A, że osobiście nie lubię przerostu formy nad treścią, taki krok jest
dla mnie nie do przyjęcia (Dlatego nie używam iTunes, a nowe Windowsy
mają u mnie niezmazywalnego minusa na starcie). Minimum wagi, maksimum
możliwości!

Drugim powodem jest nadmiarowa, i w tym wypadku nie potrzebna kolumna
określająca typ obiektu w dziedziczeniu typu \ **column\_aggregation**.
Dziedziczyć po dostarczanym profilu powinna tylko jedna klasa,
rozszerzająca ten profil.

Jedno mnie tylko zastanawia, dlaczego zbudowane modele, podstawowy i ten
rozszerzony posiadają te same funkcjonalności? Jeśli rozszerzamy Profil
dodając jakąś kolumnę, pojawia się on i w modelu podstawowym, jak i
rozszerzonym. Wykorzystać tę właściwość, czy raczej pozostać przy
zdrowym rozsądku na wypadek poprawienia tego zachowania w kolejnych
edycjach symfony lub doctrine? Jak to dobrze kolega Jacek ujął:
*Inheritance Hell*. O dziedziczeniu w Doctrine można przeczytać w
`dokumentacji <http://www.doctrine-project.org/documentation/manual/1_2/en/inheritance>`_.

Wracając do innych projektów, mam nadzieję, że w weekend opakuję klasy
Routingu w plugin i opublikuję, wprowadzając kilku poprawek i możliwości
dodawania opcji. A i w pracy szykuje się ciekawy (mam nadzieję) plugin
dotyczący Behaviourów Doctrine.
