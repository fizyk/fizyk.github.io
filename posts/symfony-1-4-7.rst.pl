.. title: symfony 1.4.7
.. slug: symfony-1-4-7
.. date: 2010/09/23 08:09:25
.. tags: symfony, doctrine, php, framework
.. link:
.. description: Nowa wersja symfony (1.4.7) ujrzała światło dzienne wczoraj. Nowa wersja zawiera głównie poprawki, jedno usprawnienie, oraz nową wersję doctrine (1.2.3).

Nowa wersja `symfony
(1.4.7) <http://www.symfony-project.org/blog/2010/09/22/symfony-1-3-7-1-4-7>`_
ujrzała światło dzienne wczoraj. Nowa wersja zawiera głównie poprawki,
jedno usprawnienie, oraz nową wersję `doctrine
(1.2.3) <http://www.doctrine-project.org/blog/doctrine-orm-version-1-2-3-released>`_.

Ta wersja symfony potrafi użyć skompilowane jądro doctrine, o ile w
projekcie takie się znajduje. Zmiana ta powinna wpłynąć na wydajność
projektu. Aby skompilować jądro doctrine, najlepiej zainstalować
najnowszą wersję pluginu
`sfTaskExtraPlugin <http://www.symfony-project.org/plugins/sfTaskExtraPlugin/1_3_3>`_,
a następnie odpalić taska **doctrine:compile**.

Dodatkowo, nowa wersja doctrine pozwala na umieszczenie podzapytań w
sekcji **HAVING**.

Niestety, nie obyło się bez błędów. Nowa wersja symfony nie ładuje
**javascriptu** paska debuggera i na chwilę obecną działa tylko
zamykanie.
