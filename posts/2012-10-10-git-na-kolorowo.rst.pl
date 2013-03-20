.. title: git na kolorowo
.. slug: git-na-kolorowo
.. date: 2012/10/10 21:10:42
.. tags: git
.. link:
.. description: Domyślne usawienia kolorów w konsolowym gicie, nie są zbyt wyszukane. Wszystko jest takie same, przeważnie białe. Aby temu zaradzić, można ustawić te oto wartości:

Domyślne usawienia kolorów w konsolowym gicie, nie są zbyt wyszukane.
Wszystko jest takie same, przeważnie białe. Aby temu zaradzić, można
ustawić te oto wartości:

.. TEASER_END

.. code-block:: bash

    git config --global color.diff auto
    git config --global color.status auto
    git config --global color.branch auto

Są to oczywiscie polecenia wykonywane w terminalu. Dzięki temu, od razu
dostrzeżemy np. status plików, niedodane do stage area pliki,
wyświetlane są na czerwono, podczas, gdy te, które mają być w kolejnym
commicie, na zielono.
