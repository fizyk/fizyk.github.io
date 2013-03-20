.. title: Listowanie metod modułu w pythonie
.. slug: listowanie-metod-modulu-w-pythonie
.. date: 2012/08/17 20:08:03
.. tags: python, howto
.. link:
.. description: Aktualnie badam wydajność trzech bibliotek łączących do bazy danych w połączeniu z sqlalchemy. Są to mysql-connector, MySQLdb oraz oursql. Po przygotowaniu podstaw, zacząłem się zastanawiać, w jaki sposób dodać kolejne testy i nie przejmować się modyfikacją podstawy testów.

Aktualnie badam wydajność trzech bibliotek łączących do bazy danych w
połączeniu z sqlalchemy. Są to mysql-connector, MySQLdb oraz oursql. Po
przygotowaniu podstaw, zacząłem się zastanawiać, w jaki sposób dodać
kolejne testy i nie przejmować się modyfikacją podstawy testów.

Znalazłem kilka rozwiązań, z czego najlepsze wykorzystywały metodę
**dir**:

::

    import types
    import module

    alchemy_tests = [module.__dict__.get(test) for test in dir(module)
                         if isinstance(module.__dict__.get(test), types.FunctionType)
                            and test.startswith('sqltest_')]

W kodzie są dwie głowne części. Pierwsza odpowiada za iterację po
wynikach metody dir:

::

    module.__dict__.get(test) for test in dir(module)

Druga jest warunkiem regulującym dodanie elementu do listy:

::

    if isinstance(module.__dict__.get(test), types.FunctionType)
    and test.startswith('sqltest_')

Warto pamiętać, że **dir** zwróci tylko nazwy elementów modułu, stąd
użycie **module.\_\_dict\_\_.get** .

A poniżej wersja rozwinięta:

::

    alchemy_tests = []
        for test in dir(module):
            if isinstance(module.__dict__.get(test), types.FunctionType) \
                and test.startswith('sqltest_'):
                alchemy_tests.append(module.__dict__.get(test))

