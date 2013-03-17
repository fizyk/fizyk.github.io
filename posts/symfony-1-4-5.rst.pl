.. title: symfony 1.4.5
.. slug: symfony-1-4-5
.. date: 2010/06/01 19:06:09
.. tags: symfony, php, framework, bezpieczeństwo
.. link:
.. description: Sensio Labs wydało nową wersję frameworka symfony. Wersja 1.4.5 zawiera dość istotną poprawkę bezpieczeństwa, gdyż zmienia wygenerowany walidator dla pola z kluczem głównym obiektu formularza. Walidator generowany do tej pory pozwalał na ręczną podmianę wartości id, a tym samym aktualizację rekordu innego, niż ten, do którego użytkownik uzyskał dostęp.

Sensio Labs wydało nową wersję `frameworka
symfony <http://www.symfony-project.org/blog/2010/05/31/symfony-1-3-5-and-1-4-5>`_.
Wersja 1.4.5 zawiera dość istotną poprawkę bezpieczeństwa, gdyż zmienia
wygenerowany walidator dla pola z kluczem głównym obiektu formularza.
Walidator generowany do tej pory pozwalał na ręczną podmianę wartości
id, a tym samym aktualizację rekordu innego, niż ten, do którego
użytkownik uzyskał dostęp.

Po aktualizacji należy uruchomić następujące zadania:

::

    // Doctrine
    ./symfony doctrine:build --all-classes
    ./php symfony cache:clear

    // Propel
    ./php symfony propel:build --all-classes
    ./php symfony cache:clear

A następnie wyczyścić cache projektu.

Pozostałe zmiany to między innymi:

-  wysyłanie kodu statusu 503, gdy aplikacja została zablokowana
-  lime w wersji 1.0.9
-  Propel w wersji 1.4.2
-  task doctrine:clean czyści pliki formularzy, jeśli ich generacja
   została wyłączona w późniejszym okresie.

Nową wersję symfony można pobrać
stąd: \ `http://www.symfony-project.org/installation <http://www.symfony-project.org/installation>`_
a changelog znajduje się
tutaj: http://www.symfony-project.org/installation/1\_4/changelog
