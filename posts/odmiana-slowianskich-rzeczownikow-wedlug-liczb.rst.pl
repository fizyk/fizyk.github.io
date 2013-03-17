.. title: Odmiana słowiańskich rzeczowników według liczb
.. slug: odmiana-slowianskich-rzeczownikow-wedlug-liczb
.. date: 2010/08/04 23:08:20
.. tags: symfony, i18n, php
.. link:
.. description: Odmiana rzeczowników w językach słowiańskich jest trochę bardziej skomplikowana niż w językach zachodnich. Z pierwszą próbą zetknąłem się dostosowując swój pierwszy moduł backendowy. Szukając sposobu przetłumaczenia nie tylko tekstów, ale i odmiany ich, natknąłem się na post: Plural forms and format_number_choice na forum symfony.

Odmiana rzeczowników w językach słowiańskich jest trochę bardziej
skomplikowana niż w językach zachodnich. Z pierwszą próbą zetknąłem się
dostosowując swój pierwszy moduł backendowy. Szukając sposobu
przetłumaczenia nie tylko tekstów, ale i odmiany ich, natknąłem się na
post: `Plural forms and
format\_number\_choice <http://forum.symfony-project.org/viewtopic.php?f=3&t=11842>`_
na forum symfony.

Znajdująca się tam formuła dla helpera **format\_number\_choice()**
miała kilka wad, dlatego na podstawie istniejącej zaproponowałem własną,
która radzi sobie ze wszystkimi wariacji liczb:

::

    '[0] brak|[1] 1 wynik|{n: n % 10 > 1 && n % 10 < 5 && ( n < 11 || n > 14 ) && ( n % 100 < 11 || n % 100 > 14 ) } %1% wyniki|[5,+Inf] %1% wyników '

Idąc dalej, stworzyłem funkcję biblioteczną, która przyjmuje w
parametrach liczbę, oraz zestaw odmian rzeczownika, wybierając
odpowiednią jego formę do liczby:

::

    class Fizyk
    {
        /**
         * Function that returns proper inflection based on a number that describes it's quantity for slavic languages.

         * There are four forms: none, one singular and two plurar.
         * $word array indexes 1, 2 and 3 are mandatory, while 0 is optional
         * @param array $words
         * @param integer $number
         * @return string
         * @author Grzegorz Śliwiński
         */
        static public function slavicWordFormNumberChoice( Array $words, $number)
        {
            //throw exception if passed array doesn't kontain 1st, 2nd or 3rd form
            if( !array_key_exists( 1, $words) || !array_key_exists( 2, $words) || !array_key_exists( 3, $words ) )
            {
                //listing all keys
                $keys = '';
                foreach( array_keys( $words ) as $value )
                {
                    $keys .= $value.' ';
                }
                //throwning exception
                throw new sfException( sprintf('Word array is incomplete! Should contain indexes 1, 2 and 3. Your contains: %s', $keys ) );
            }

            //take care of the none case with word set
            if( $number == 0 && array_key_exists(0, $words) )
            {
                return $words[0];
            }
            //take care of the none case without word set
            elseif( $number == 0 && !array_key_exists(0, $words) )
            {
                $wordIndex = 3;
            }
            //One is always the same
            elseif( $number == 1 )
            {
                $wordIndex = 1;
            }
            //Second case: numbers from x2 to x4 without those from x12 to x14 (x - any number)
            elseif( $number % 10 > 1 && $number % 10 < 5 && ( $number < 11 || $number > 14 )
                    && ( $number % 100 < 11 || $number % 100 > 14 ) )
            {
                $wordIndex = 2;
            }
            else
            {
                $wordIndex = 3;
            }
            //we return numbered phrase to the world
            return $number.' '.$words[$wordIndex];
        }
    }

Jedynym mankamentem tej metody jest konieczność zdefiniowania kluczy
tablicy przekazywanych słów, ale akceptuje zestaw słów wszelakich.
