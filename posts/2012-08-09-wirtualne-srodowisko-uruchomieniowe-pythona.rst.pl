.. title: Wirtualne środowisko uruchomieniowe Pythona
.. slug: wirtualne-srodowisko-uruchomieniowe-pythona
.. date: 2012/08/09 22:08:40
.. tags: python, virtualenv
.. link:
.. description: Praca programisty wymaga niekiedy testowania nowych bibliotek i rozwiązań. Niekiedy instalujemy biblioteki do testów zapominając o nich, co może spowodować potem śmietnik w bibliotekach systemowych Pythona. Rozwiązaniem, by utrzymać porządek, jest wirtualne środowisko uruchomieniowe, virtualenv, a znacznym ułatwieniem, virtualenvwrapper.

Praca programisty wymaga niekiedy testowania nowych bibliotek i
rozwiązań. Niekiedy instalujemy biblioteki do testów zapominając o nich,
co może spowodować potem śmietnik w bibliotekach systemowych Pythona.
Rozwiązaniem, by utrzymać porządek, jest wirtualne środowisko
uruchomieniowe, virtualenv, a znacznym ułatwieniem, virtualenvwrapper.

.. TEASER_END

`Virtualenv <http://www.virtualenv.org/en/latest/index.html>`_ umożliwia
nam utrzymanie porządku w pakietach - utworzyć osobne środowisko
uruchomieniowe Pythona, którego możemy używać z jednym projektem. Takim
środowiskiem zarządzamy niezależnie od systemu, a więc mogą się tam
znajdować biblioteki niedostępne w głównym środowisku Pythona, w innych
wersjach (starsze, nowsze). Jest to wielce przydatne zarówno w testach,
jak w tworzeniu oprogramowania.

`Virtualenvwrapper <http://www.doughellmann.com/projects/virtualenvwrapper/>`_, to dodatkowy zestaw narzędzi opakowujących virtualenv. Jak to działa? W czystym virtualenv, po utworzeniu środowiska, by się do niego odwołać, musimy wywołać ścieżkę dostępu do naszej instancji Pythona:

::

    /home/asdfuser/venv/bin/python

Natomiast virtualenvwrapper pozwala wywołać po prostu **python**, co
przy włączonym środowisku venv, wywoła za nas aktualnie włączone
wirtualne środowisko. Jedyne, co trzeba zrobić, to uruchomić
odpowiednie:

.. code-block:: bash

    workon python-basic
    workon python-z-ta-super-biblioteka

Jedyny minus, to trochę bardziej skomplikowana instalacja narzędzi, za
to utworzenie nowego środowiska jest już zdecydowanie prostsze.

Najpierw należy oczywiście zainstalować virtualenvwrappera w systemie.
Ubuntu 12.04 w repozytorium posiada wersję 2.11, więc najlepiej
zainstalować najnowszą przez pip'a:

.. code-block:: bash

    pip install virtualenvwrapper

bądź:

.. code-block:: bash

    sudo pip install virtualenvwrapper

Następne polecenia wykonujemy już w kontekście zalogowanego użytkownika,
nie całego systemu:

.. code-block:: bash

    export WORKON_HOME=~/.virtualenv
    source /usr/local/bin/virtualenvwrapper.sh

Oba powyższe polecenia warto dodać jeszcze do pliku .bashrc.

Tak wykonana instalacja utworzy nam nowe kontener środowisk, oraz
zapewni auto uzupełnianie swoich komend. Możemy spokojnie umieścić go w
ukrytym katalogu, nie będziemy się do środowisk odwoływać inaczej, jak
poprzez ich nazwę.

Wirtualne środowisko najłatwiej utworzyć za pomocą polecenia
mkvirtualenv:

.. code-block:: bash

    mkvirtualenv python-basic
    mkvirtualenv -p /usr/bin/python3 python3-basic

Drugi przypadek tworzy nam środowisku uruchomieniowe python3 (musimy
oczywiście mieć zainstalowane w systemie). Teraz wystarczy się
przełączyć:

.. code-block:: bash

    workon python-basic
    workon python3-basic

Po wykonaniu drugiego polecenia, wywołanie Python w terinalu uruchomi
nam konsolę Pythona w wersji 3, a nie 2.7, jaka jest domyślnie
zainstalowana w Ubuntu 12.04

Na zakończenie, jeśli chcemy wrócić do systemowej biblioteki i przestać
używać środowiska wirtualnego, wykonujemy polecenie **deactivate**.
