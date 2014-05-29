.. title: Optymalizacja zasobów dla środowiska produkcyjnego w symfony
.. slug: optymalizacja-zasobow-dla-srodowiska-produkcyjnego-w-symfony
.. date: 2012/03/04 19:03:40
.. tags: symfony, php, css, yui compressor, compression
.. link:
.. description: Przy tworzeniu aplikacji internetowych, ważne jest, by się szybko ładowała. Jest kilka, niewykluczających się wzajemnie sposobów: optymalizacja serwera, aplikacji, lub zasobów.

Przy tworzeniu aplikacji internetowych, ważne jest, by się szybko
ładowała. Jest kilka, niewykluczających się wzajemnie sposobów:
optymalizacja serwera, aplikacji, lub zasobów.

.. TEASER_END

Najprostszym sposobem na zoptymalizowanie zasobów (np, plików CSS) jest
ich minifikacja. ich zastosowanie jest dość proste:

.. code-block:: bash

    yui-compressor path/to/css/main.css -o path/to/css/main.min.css

Dzięki temu mamy dostępną wersję zminimalizowaną naszego pliku CSS,
którą możemy załączyć w aplikacji. Oczywiście nie jest z byt wygodne
trzymanie wszystkiego w jednym pliku CSS, czasem wygodniej jest rozbić
definicje styli na kilka plików. Ułatwia to pracę, ale generuje zbędne
żądania. Proces kompresji można zmusić do kompresji do jednego pliku:

.. code-block:: bash

    yui-compressor path/to/css/main.css -o path/to/css/min.css
    yui-compressor path/to/css/other.css >> path/to/css/min.css

Zostaje do rozwiązania tylko jeden problem. pierwsza sytuacja
minifikacji wymaga załączenia pliku zminifikowanego, więc, by
przetestować zmiany w środowisku developerskim, konieczne jest
minifikowanie pliku CSS po każdej edycji. W drugiej sytuacji też nie
jest wygodnie, gdyż dodatkowo dochodzi różnica w ilości plików.

Na szczęście w plikach konfiguracyjnych yml symfony 1.4 możemy używać
PHP i imamy dostęp do elementów frameworka. Dzięki temu, możemy dla obu
środowisk, produkcyjnego i developerskiego podać osobne zestawy CSS'ów
(podobnie jak js):

.. code-block:: yaml

    default:
      stylesheets:
    <?php if( sfContext::getInstance()->getConfiguration()->getEnvironment() == 'dev'): ?>
        - main.css
        - css/other.css
    <?php else: ?>
        - css/min.css
    <?php endif; ?>

Ten sam sposób możemy stosować w głównym pliku view.yml, jak i w
view.yml dla każdego modułu. Jedyne o czym trzeba pamiętać, to
utrzymanie aktualności skryptów minifikujących jak i odpowiednich sekcji
plików konfigurujących widoki.
