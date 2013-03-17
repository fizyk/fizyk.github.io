.. title: symfony 1.4.4 i BaseToPrfx
.. slug: symfony-1-4-4-i-basetoprfx
.. date: 2010/04/08 21:04:31
.. tags: symfony, doctrine, migracje, toprfx, diem
.. link:
.. description: Wczoraj wyszła czwarta wersja symfony z linii 1.3.x i 1.4.x (Zaanonsowane na blogu symfony). Co ciekawe, poprawki wprowadzone w tej wersji częściowo adresują problem poruszony w moim poprzednim poście, dlatego postanowiłem przetestować migracje tak szybko jak na to zadania pozwolą.

Wczoraj wyszła czwarta wersja symfony z linii 1.3.x i 1.4.x
(Zaanonsowane na `blogu
symfony <http://www.symfony-project.org/blog/2010/04/06/symfony-1-3-4-and-1-4-4>`_).
Co ciekawe, poprawki wprowadzone w tej wersji częściowo adresują problem
poruszony w moim poprzednim poście, dlatego postanowiłem przetestować
migracje tak szybko jak na to zadania pozwolą.

Dzisiaj w pracy znalazłem chwilę czasu i postanowiłem sprawdzić
zachowanie tej nowej wersji podczas generowania migracji różnicowych
(**doctrine:generate-migrations-diff**). Środowisko testowe składało się
z **cmf diem 5.0.2** i aktualnej wersji symfony. Wynik testu był
częściowo zadowalający: uruchomienie taska nie powoduje więcej błędu
braku klasy **BaseToPrfx** - autoloader symfony został poprawiony.
Niestety, cała reszta problemów na razie pozostała. Tak więc nadal
będzie trzeba sprawdzać migracje w poszukiwaniu usuwanych tabel
generowanych przez behavioury.
