.. title: Zima się skończyła
.. slug: zima-sie-skonczyla
.. date: 2010/02/28 22:02:35
.. tags: strona, symfony, zima, tinymce, captcha, sfDoctrineApplyPlugin
.. link:
.. description: Za oknem śnieg praktycznie już zniknął, tylko w głębokim cieniu blokowisk zostały brudne kupy tego odgarniętego z dróg i przejść. A taka udana zima była w tym roku. Mróz wesoło szczypał w policzki, śnieg rozświetlał okolicę i przykrywał szare miasto. Było pięknie, mi się papa cieszyła, szczególnie po świeżym opadzie. Teraz niestety przyjdzie nam oglądać przez jakiś miesiąc miasto w kolorach szarości. Głęboka zieleń zagości za oknami gdzieś na przełomie maja i czerwca. Pozostaje mi tylko życzyć sobie takiej zimy ponownie za rok, sobie, bo jak się okazuje nie wszyscy dookoła normalną zimę lubią.

Za oknem śnieg praktycznie już zniknął, tylko w głębokim cieniu
blokowisk zostały brudne kupy tego odgarniętego z dróg i przejść. A taka
udana zima była w tym roku. Mróz wesoło szczypał w policzki, śnieg
rozświetlał okolicę i przykrywał szare miasto. Było pięknie, mi się papa
cieszyła, szczególnie po świeżym opadzie. Teraz niestety przyjdzie nam
oglądać przez jakiś miesiąc miasto w kolorach szarości. Głęboka zieleń
zagości za oknami gdzieś na przełomie maja i czerwca. Pozostaje mi tylko
życzyć sobie takiej zimy ponownie za rok, sobie, bo jak się okazuje nie
wszyscy dookoła normalną zimę lubią.

.. TEASER_END

A wracając do postępu prac. Uruchomiłem kanał atom. W tygodniu już
działała Sitemapa (oparta na pluginie
`prestaSitemapPlugin <http://www.symfony-project.org/plugins/prestaSitemapPlugin>`_).
Przygotowałem dwie klasy routingu: collection i zwykłą. Służy to to do
generowania ścieżki do listy. Aktualnie generowane są trzy: domyślna -
**/**, ze wskaźnikiem na stronę - **/strona/[numer]** oraz na element
listy **/[element]**. Krótko mówiąc dokładnie takie ścieżki, jakie widać
(w przypadku stronicowania dopiero będzie widać) tutaj na blogu.
Zastanawiam się teraz jak je ładnie opakować, opisać i opublikować jako
plugin. W końcu nie zawsze trzeba generować listy z pełnią opcji
**CRUD**, z których w zasadzie tylko R będzie dostępna w aplikacji.

Aktualnie na warsztacie mam moduł logowania oparty na
`sfDoctrineApplyPlugin <http://www.symfony-project.org/plugins/sfDoctrineApplyPlugin>`_.
Ponieważ oparty jest na Zend Mailu koniecznie trzeba było to poprawić.
Po co komu nawet minimalna wersja Zend Framework, jeśli potrzebna mu
tylko biblioteka mailujaca? Tym bardziej, że zajmuje wcale niemało. Na
szczęście z pomocą przyszło forum symfony, a konretnie
`ten <http://forum.symfony-project.org/index.php/t/25217/>`_ temat.
Stosując się do zastosowanych tam porad można rozwiązać wszystkie
problemy w pluginem i usuwaniem zależności od Zend Mail. W chwili
obecnej implementuję modyfikację w sam plugin. Pozostanie mi tylko
dodanie polskich tłumaczeń i18n, przejrzenie archiwum z modyfikacjami
umieszczonymi przez stephena i włączenie ich do modyfikacji i
prawdopodobnie dołączenie w jakiś sposób dziedziczenia. Będzie doskonałe
ćwiczenie. Oczywiście, nie uruchomię możliwości rejestrowania się,
dopóki nie umieszczę możliwości komentowania artykułów. Nie wpominając o
tym, że na pewno dołączę do formularza rejestracji
`CAPTCHĘ <http://pl.wikipedia.org/wiki/CAPTCHA>`_.

Z innych rozwiązań, poprawiłem sobie konfigurację TinyMCE, edytora,
którego używam do wpisywania wiadomości. Przestał mi szczęśliwie
modyfikować ó na htmlowy odpowiednik ó. Będę musiał wymyślić jeszcze jak
dołączyć swoją konstrukcję obrazka otoczonego divami i podpisem pod,
oraz dołączenie odpowiadającego za jego wyświetlanie stylu do edytora.
