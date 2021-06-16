.. title: Settery pól behavioura dla Doctrine
.. slug: settery-pol-behavioura-dla-doctrine
.. date: 2010/04/27 21:04:48
.. tags: doctrine, dmTag, behaviour
.. link:
.. description: Przy okazji przenoszenia dmTagPlugin z powrotem do korzeni Diema, do symfony, przypomniała mi się jedna rzecz, którą warto poruszyć. Dotyczy ona tworzenia behavioura i obsługi pól modelu wprowadzanych przez szablon behavioura do modelu otrzymującego naszego behavioura.

Przy okazji przenoszenia dmTagPlugin z powrotem do korzeni Diema, do
symfony, przypomniała mi się jedna rzecz, którą warto poruszyć. Dotyczy
ona tworzenia behavioura i obsługi pól modelu wprowadzanych przez
szablon behavioura do modelu otrzymującego naszego behavioura.

.. TEASER_END

Jedną z moich pierwszych prób w tworzeniu behaviourów dla Doctrine w
symfony, była próba nadpisania metody odpowiedzialnej za aktualizacje
pola wprowadzonego pola. Nie muszę mówić, że była ona raczej mało
owocna.

Szablon Behavioura Doctrine znajduje się w hierarchii niżej, niż
podstawowy obiekt modelu, który posiada podstawowe gettery i settery. Z
tego powodu wszystkie gettery i settery z Szablonu Behavioura
(rozszerzenia doctrine) są automatycznie nadpisywane przez te z modelu
podstawowego. Jedynym sposobem na obsłużenie w odpowiedni sposób z
automatu konkretnych pól, jest napisanie metod zastępczych.

Tak też jest i w pluginie dmTagPlugin, w którym właściwe pole
**tags\_list** jest w listenerze usuwane z formularza, a na jego miejsce
umieszczone zostaje pole **tags** z odpowiednim widgetem i validatorem.
Pole to nie ma odpowiedniego gettera w modelu, a co za tym idzie, nie
posiada gettera, ani settera. Posiada za to zdefiniowany setter w
szablonie, który przejmuje wartości pola formularza i obrabia je według
naszego uznania w szablonie. Dzięki temu, tagi są dołączane i
jednocześnie tworzone jeśli nie istnieją.

Wstrzykiwanie ma sens jeśli używamy formularzy lub dodać komentarz do
odpowiednich setterów mówiący o tym, by użyć innej metody.
