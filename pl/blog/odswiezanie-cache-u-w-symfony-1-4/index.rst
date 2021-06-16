.. title: Odświeżanie cache'u w symfony 1.4
.. slug: odswiezanie-cache-u-w-symfony-1-4
.. date: 2010/06/06 21:06:36
.. tags: symfony, php, cache, filecache
.. link:
.. description: Obsługa cache w symfony jest nadzwyczaj ciekawa i w miarę prosta. By poznać wszystkie, a przynajmniej większość, aspektów cachowania, warto przeczytać rozdział 12 nowej książki o symfony: A Gentle Introduction to symfony.  Postanowiłem trochę popracować nad cachem pod wpływem pewnej korespondencji.

Obsługa cache w symfony jest nadzwyczaj ciekawa i w miarę prosta. By
poznać wszystkie, a przynajmniej większość, aspektów cachowania, warto
przeczytać rozdział 12 nowej książki o symfony: `A Gentle Introduction
to symfony <http://www.symfony-project.org/gentle-introduction/1_4/en/12-Caching>`_.  Postanowiłem trochę popracować nad cachem pod wpływem pewnej korespondencji.

.. TEASER_END

Jeśli chodzi o uruchomienie cachu, nie ma nic prostszego. Wystarczy
ustawić odpowiednie wartości, odpowiednich atrybutów w ustawieniach
aplikacji. Można nawet użyć odpowiedniego helpera. Również odświeżanie
cache jest nadzwyczaj proste - o ile robi się to w tej samej aplikacji.
Odświeżanie cache'u w jednej z aplikacji projektu z innej wymaga pewnej
gimnastyki.

.. code-block:: php

    $frontend_cache_dir = sfConfig::get('sf_cache_dir').DIRECTORY_SEPARATOR.'frontend'. DIRECTORY_SEPARATOR.sfConfig::get('sf_environment').DIRECTORY_SEPARATOR.'template';
    $cache = new sfFileCache(array('cache_dir' => $frontend_cache_dir)); // Use the same settings as the ones defined in the frontend factories.yml
    $cache->removePattern('user/show?id=12');

Powyższy kod pochodzi ze wspomnianej wyżej książki, rozdział 12.  W
przykładzie zaprezentowanym w książce jest tylko jeden problem. Możliwe,
że takie wywołanie działa dla innych sposobów cachowania, ale
**sfFileCache::removePattern** łączy przekazany ciąg znaków (*pattern*)
z wartością **'cache\_dir'** w następujący sposób: *cache\_dir + / + pattern + .cache*

Natomiast normalnie w cachu plikowym, pomiędzy ścieżką do cachu, a
wartością parametru znajdują się jeszcze dwa poziomy: *serwer/all*

To jest jeden z powodów, dla którego nie uda się odświeżyć cachu. Drugim
jest fakt, iż metoda removePattern nie zawiera mechanizmów
zamieniających parametry na ścieżkę cache.

Należy jednak zwrócić uwagę, że przekazując między innymi dwie gwiazdki
jako parametr można usunąć cały cache aplikacji frontend:

.. code-block:: php

    $cache->removePattern('**');

Zauważając to, łatwo się zorientować, że prawidłowy parametr metody w
przykładzie powinien mieć postać:

.. code-block:: php

    //remove specified show
    $cache->removePattern('**/user/show/id/12');
    //remove all shows
    $cache->removePattern('**/user/show/**');

Bazując na swoich poszukiwaniach, i by nie powtarzać niepotrzebnie kod,
stworzyłem prostą metodę statyczną, która pozwala mi wyczyścić żądany
fragment cachu:

.. code-block:: php

    class Fizyk
    {
        /**
         * ...
         */


        /**
         * method clears frontend cache with given patterns
         * @param (mixed) $patterns
         */
        static public function clearFrontendCache( $patterns = '**' )
        {
          $frontend_cache_dir = sfConfig::get('sf_cache_dir').DIRECTORY_SEPARATOR.'frontend'. DIRECTORY_SEPARATOR.sfConfig::get('sf_environment').DIRECTORY_SEPARATOR.'template';
          $cache = new sfFileCache(array('cache_dir' => $frontend_cache_dir));
          if( is_array( $patterns ) )
          {
            foreach( $patterns as $pattern )
            {
              $cache->removePattern( $pattern );
            }
          }
          else
          {
            $cache->removePattern( $patterns );
          }
        }
    }

Modyfikując tę metodę bardziej, można również umożliwić wybór aplikacji
podczas jej wywoływania.
