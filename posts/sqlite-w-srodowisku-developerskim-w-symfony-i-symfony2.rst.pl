.. title: sqlite w środowisku developerskim w symfony i symfony2
.. slug: sqlite-w-srodowisku-developerskim-w-symfony-i-symfony2
.. date: 2012/01/26 20:01:23
.. tags: symfony, doctrine, php, symfony2, sqlite
.. link:
.. description: Sqlite nie koniecznie jest dobrą bazą produkcyjną dla tworzonych aplikacji internetowych. Jednak podczas ich tworzenia powinna nadać się idealnie. Tym bardziej, jeśli nie chcemy naszej maszyny developerskiej obarczać dodatkowymi procesami, czy też pilnować włączania/wyłączania serwerów bazy danych, sqlite nada się idealnie.

Sqlite nie koniecznie jest dobrą bazą produkcyjną dla tworzonych
aplikacji internetowych. Jednak podczas ich tworzenia powinna nadać się
idealnie. Tym bardziej, jeśli nie chcemy naszej maszyny developerskiej
obarczać dodatkowymi procesami, czy też pilnować włączania/wyłączania
serwerów bazy danych, sqlite nada się idealnie.

Konfiguracja dla doctrine w symfony 1.4 powinna wyglądać następująco:

::

    # database.yml  
    dev:
      doctrine:
        class: sfDoctrineDatabase
        param:
          dsn: "sqlite:///%SF_DATA_DIR%/doctrine/sqlite_dbfile.db?mode=0666"
          username: root
          password: ~
          encoding: utf8
          attributes:
            default_table_collate: utf8_general_ci
            default_table_charset: utf8

Natomiast dla Symfony2 w ten sposób:

::

    # Doctrine Configuration
    doctrine:
        dbal:
            driver:   pdo_sqlite
            dbname:   Symfony
            user:     root
            password: null
            host:     localhost
            port:     ~
            path:     "%kernel.root_dir%/data/symfony.sqlite"
            charset:  UTF8

Kilka rzeczy, o których należy pamiętać, konfigurując sobie środowisko
developerskie w ten sposób:

Po pierwsze, wszelkie zmiany w modelu danych powinny zostać
przetestowane w systemie zarządzania bazami, które będą/są używane w
środowisku produkcyjnym.

Po drugie, jeśli kod projektu znajduje się w repozytorium, foldery z
bazą powinny być ignorowane przez git/svn/czy bazaar. Tak samo
powinniśmy je ignorować przy eksporcie na produkcję. Plik bazy sqlite
będzie się zmieniał non stop, nie potrzebujemy sztucznego nabijania
rewizji.

Dodatkowo, warto pamiętać, że `sqlite nadaje się idealnie do
skonfigurowania środowiska
testowego <http://xlab.pl/konfiguracja-projektu-w-symfony-pod-test-driven-development/>`_
naszej aplikacji w symfony.
