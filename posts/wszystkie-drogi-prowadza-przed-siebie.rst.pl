.. title: Wszystkie drogi prowadzą przed siebie
.. slug: wszystkie-drogi-prowadza-przed-siebie
.. date: 2010/03/13 21:03:37
.. tags: symfony, sfDoctrineApply, fzDoctrinePagedRoute, plugin, crud, routing
.. link:
.. description: Oczywiście, wszystkie drogi zdefiniowane w pliku routing.yml. Rzym jest tutaj zupełnie nieistotny.

Oczywiście, wszystkie drogi zdefiniowane w pliku \ **routing.yml**. Rzym
jest tutaj zupełnie nieistotny.

Dzisiaj udostępniłem plugin
(`fzDoctrinePagedRoutePlugin <http://www.symfony-project.org/plugins/fzDoctrinePagedRoutePlugin>`_)
dla symfony zawierający klasy routingu dla list elementów dla frontendu.

Klasa kolekcji zawarta w pluginie umożliwia wygenerowanie trzech ścieżek
dla modułów nie wymagających interakcji z użytkownikiem za pomocą
operacji create, update, ani delete, dostarcza ładny url bez żadnych
ciągów zapytań. Co najważniejsze, dostarcza odpowiedź http 404 dla stron
listy nie zawierających żadnych elementów, czyli o numerze większym niż
zakładana ilość stron przy odpowiedniej liczbie elementów na stronę lub
też ujemnym.

Klasa ścieżki dodatkowo dostarcza metodę *getPager()*, która zwraca
gotowy do użycia w szablonie obiekt typu sfDoctrinePager, ustawiony na
konkretnej stronie z odpowiednią ilością elementów na stronę. Plugin
możecie pobrać
`tutaj <http://www.symfony-project.org/plugins/fzDoctrinePagedRoutePlugin>`_.

Ostatnio w domu pracowałem głównie nad paczką będącą forkiem
`sfDoctrineApplyPlugin <http://www.symfony-project.org/plugins/sfDoctrineApplyPlugin>`_.
Jest prawie gotowa, a jej pierwsze efekty możecie zobaczyć na forum
symfony, gdzie toczyła się dyskusja dotycząca pozbawienia
sfDoctrineApplyPlugin zależności od Zend Framework. W chwili obecnej
wygładzam README i przygotowuję dodatkowo listę funkcjonalności do
uzupełnienia w pluginie, więc ostateczne efekty powinny być niedługo
dostępne w systemie pluginów, a narazie zabieram się do uzupełnienia
symfonowego repozytorium, a później... może coś o Caprice?
