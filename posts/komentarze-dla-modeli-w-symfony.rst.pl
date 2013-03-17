.. title: Komentarze dla modeli w symfony
.. slug: komentarze-dla-modeli-w-symfony
.. date: 2010/04/15 20:04:01
.. tags: symfony, plugin, vjComment, dmTag, autocomplete
.. link:
.. description: Wczoraj w repozytorium pluginów symfony pojawiła się wersja 1.1.0 pluginu vjCommentPlugin, w której maczałem swoje palce. Dodałem możliwość przypięcia wysyłanych komentarzy do użytkownika, dzięki czemu można je powiązać z konkretnym użytkownikiem i wyświetlić na przykład listę jego wypowiedzi, policzyć ile posiada on komentarzy, ile tych moderowanych/usuniętych.

Wczoraj w repozytorium pluginów symfony pojawiła się wersja 1.1.0
pluginu
`vjCommentPlugin <http://www.symfony-project.org/plugins/vjCommentPlugin>`_,
w której maczałem swoje palce. Dodałem możliwość przypięcia wysyłanych
komentarzy do użytkownika, dzięki czemu można je powiązać z konkretnym
użytkownikiem i wyświetlić na przykład listę jego wypowiedzi, policzyć
ile posiada on komentarzy, ile tych moderowanych/usuniętych.

Dodatkowo na chwilę obecną, z modelu użytkownika pobierany jest oprócz
id tylko login/nazwa użytkownika, ale na pewno będzie można zdefiniować
metody, dzięki którym będzie możliwe pobranie innych informacji na
przykład z profilu.

Sam projekt behaviora posiada kilka niedociągnięć (np. brak jest relacji
pomiędzy modelem, a komentarzem), ale myślę, że i je uda się dodać.

W chwili obecnej pracuję nad backportem do symfony diemowego
`DmTagPlugin <http://diem-project.org/plugins/dmtagplugin>`_, tak więc
na chwilę odkładam sfForkedDoctrineApply jak i vjComment na półkę. W
backporcie DmTag prawdopodobnie wykorzystaniem, przynajmniej częściowo
plugin
`sfDoctrineFBAutocompletePlugin <http://www.symfony-project.org/plugins/sfDoctrineFBAutocompletePlugin>`_.
Pomysł jest interesujący, ale na pierwszy rzut oka posiada kilka
niedociągnięć, jak na przykład brak możliwości jakiegoś filtrowania
podawanych obiektów według określonych kryteriów. Krótko mówiąc, nie
widzę możliwości zdefiniowania własnego dql'a wykorzystując tylko
oryginalny widget zawarty w tym pluginie.
