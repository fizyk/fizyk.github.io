.. title: curlftpfs - zastąpić klienta ftp
.. slug: curlftpfs-zastapic-klienta-ftp-pl
.. date: 2010/11/30 22:11:08
.. tags: linux, ftp, curlftpfs, tools
.. link:
.. description: Aktualizacja projektu poprzez serwer ftp może być żmudna. Idealnym rozwiązaniem byłoby patrzeć na zawartość serwera z projektem jak na maszynę, na której pracujemy. Jednak gdy to nie jest możliwe, a nie jest na zdecydowanej większości serwerów współdzielonych oferowanych przez polskie firmy, pozostaje spojrzeć na zawartość udostępnianą przez serwer ftp jak na system plików.

Aktualizacja projektu poprzez serwer ftp może być żmudna. Idealnym
rozwiązaniem byłoby patrzeć na zawartość serwera z projektem jak na
maszynę, na której pracujemy. Jednak gdy to nie jest możliwe, a nie jest
na zdecydowanej większości serwerów współdzielonych oferowanych przez
polskie firmy, pozostaje spojrzeć na zawartość udostępnianą przez serwer
ftp jak na system plików.

By podpiąć serwer ftp jako system plików przyda się **curlftpfs**. W
skrócie jak podłączyć można przeczytać `tutaj
(ang) <http://hartvig.de/2009/howto-mount-a-ftp-drive-in-ubuntu/trackback/>`_
(dzięki **MacDada**).

Takie podłączenie, co prawda ułatwia trochę aktualizację projektu, ale
ciągle jest dość powolne. Raczej nie uruchamiałbym żadnych tasków
symfony, a na czyszczenie cache'u, dobrze przeznaczyć większą ilość
czasu na usunięcie zawartości cache'u...

Samo podpięcie nie jest może zbyt wygodne, ale operacje na plikach są
już dużo wygodniejsze. Ale po zautomatyzowaniu wszystkich operacji
jakimś skryptem, wszystko jest na odpalenie tego skryptu. Choć tak
naprawdę, nic nie zastąpi dostępu do serwera przez ssh.
