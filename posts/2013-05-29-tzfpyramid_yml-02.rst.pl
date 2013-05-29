.. title: tzf.pyramid_yml 0.2
.. slug: tzfpyramid_yml-02
.. date: 2013/05/29 20:06:41
.. tags: python,pyramid,yaml
.. link:
.. description: tzf.pyramid_yml 0.2 - domyślna konfiguracja w paczce, inspekcja ustawień aplikacji z linii komend.


Plug-in tzf.pyramid_yml jest paczką, która umożliwia dołączenie dziedziczonej i rozszerzalnej konfiguracji aplikacji napisanej w Pyramidzie. Dzisiaj wypuściłem też wersję 0.2.

Paczka umożliwia zdefiniowanie konfiguracji głównej, w pliku config.yml i konfiguracji nadpisujących niektóre tylko elementy, ze względu na środowisko, w którym zostaje uruchomiona.


.. TEASER_END

Od wersji 0.2, plugin umożliwia również dodanie domyślnych ustawień w innych paczkach przeznaczonych dla aplikacji we frameworku pyramid. Wystarczy użyć metody `tzf.pyramid_yml.config_defaults <https://tzfpyramid_yml.readthedocs.org/en/v0.2.0/api.html#tzf.pyramid_yml.config_defaults>`_. Metoda ta powinna być również obecna na obiekcie Configuratora, jeśli tzf.pyramid_yml został dołączony przez *config.include()*.

Paczka dostarcza również polecenie lini komend **pconfig**, które umożliwia inspekcję konfiguracji.

* `Dokumentacja <https://tzfpyramid_yml.readthedocs.org/en/v0.2.0/index.html>`_
* `PyPI <https://pypi.python.org/pypi/tzf.pyramid_yml/0.2.0>`_
* `GitHub <https://github.com/fizyk/pyramid_yml>`_
