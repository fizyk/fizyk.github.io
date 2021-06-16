.. title: fzBlameable
.. slug: fzblameable
.. date: 2010/08/01 22:08:17
.. tags: symfony, doctrine, plugin, behaviour, php, fzBlameable
.. link:
.. description: Podczas pierwszego kontaktu z symfony i doctrine, nie zdawałem sobie sprawy z ułatwień oferowanych przez behavioury. Sluggable był z początku swego rodzaju magią, a ja lubię wiedzieć, jakie kółka zębate wprawiają machinę w ruch. Kwiestię właściciela, który stworzył dany obiekt, rozwiązywałem tam, gdzie obiekt był tworzony, w każdej akcji osobno.

Podczas pierwszego kontaktu z symfony i doctrine, nie zdawałem sobie
sprawy z ułatwień oferowanych przez behavioury. Sluggable był z początku
swego rodzaju magią, a ja lubię wiedzieć, jakie kółka zębate wprawiają
machinę w ruch. Kwiestię właściciela, który stworzył dany obiekt,
rozwiązywałem tam, gdzie obiekt był tworzony, w każdej akcji osobno.

.. TEASER_END

Ale z czasem, behavioury przestały być tajemnicze, a oferowane
możliwości znacznie ułatwiały tworzenie aplikacji. Blameable jest
behaviourem, który w prosty sposób załatwia sprawę właściciela obiektu,
a także osoby aktualizującej ten obiekt:

-  Dodaje pola - klucze obce;
-  Relację do modelu użytkownika;
-  Ustawia momencie tworzenia i aktualizacji ustawia odpowiednie
   wartości pól właściciela/soby aktualizującej.

Rozwiązanie zaproponowane przez **Blameable** jest uniwersalne, i
dlatego użycie go w symfony, nie jest możliwe natychmiast po instalacji
bibliotek. Wymaga zmiany Listenera
(`przykład <http://botchedcode.com/2010/02/16/symfony-1-4-doctrine-extension-blameable-w-sfguard/>`_),
oraz szeregu ustawień w definicji behavioura dla modelu.

Używając oryginalnego behavioura (modyfikacji dla diem również), można
zauważyć jeden mankament: brak jest aliasu zwrotnego z obiektu
użytkownika, do obiektu tworzonego. Głównie z tego powodu zdecydowałem
się stworzyć modyfikację Blameable dla symfony i sfDoctrineGuard. Dodane
fragmenty kodu są nieznaczną modyfikacją:

.. code-block:: php

    Doctrine_Core::getTable( 'sfGuardUser' )->bind(
            array($className.' as Created'.$className.'s',
              array( 'class'    => $className,
                'local'    => $this->_options['relations']['created']['foreign'],
                'foreign'  => $this->_options['columns']['created']['name']
            )), Doctrine_Relation::MANY );

Ale jakże ułatwią tworzenie zapytań pobierających obiekty stworzone
przez użytkownika. Zwykłe pobieranie wszystkich obiektów stworzonych
przez użytkownika może być karkołomne, ale dla podzapytań taki alias
jest idealny.

Domyślnie `fzBlameable
1.0.0 <http://www.symfony-project.org/plugins/fzBlameablePlugin/1_0_0>`_
współdziała domyślnie z sfDoctrineGuard 4.x, ale do użycia go w
sfDoctrineGuard 5.x wystarczy zmienić typy pól created i updated:

.. code-block:: php

    MyModel:
      actAs:
        fzBlameable:
          columns:
            created:
              length: 8
            updated:
              length: 8

