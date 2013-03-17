.. title: Sortowanie pobieranych elementów z dql według zadanego zbioru
.. slug: sortowanie-pobieranych-elementow-z-dql-wedlug-zadanego-zbioru
.. date: 2010/08/16 20:08:51
.. tags: doctrine, php, dql, sql, where in, order by
.. link:
.. description: Czasem zdarza się, że chcielibyśmy pobrać z bazy danych elementy z określonego zbioru, a także je posortować według kolejności, w jakiej w tym zbiorze się znajdują. Samo zadanie skomplikowane nie jest, aczkolwiek nie jest również takie proste. Poniżej zaprezentuję podejście do problemu, oraz pułapki, które mogą nas spotkać podczas rozwiązywania tego problemu.

Czasem zdarza się, że chcielibyśmy pobrać z bazy danych elementy z
określonego zbioru, a także je posortować według kolejności, w jakiej w
tym zbiorze się znajdują. Samo zadanie skomplikowane nie jest,
aczkolwiek nie jest również takie proste. Poniżej zaprezentuję podejście
do problemu, oraz pułapki, które mogą nas spotkać podczas rozwiązywania
tego problemu.

Pobranie z bazy danych elementów z określonego zbioru jest proste do
wykonania, zarówno w sql:

::

    WHERE IN (3,1,2)

jak i w dql:

::

    $query->whereIn( 'id', array( 3, 1, 2 ) );

Takie pytanie niestety zwróci nam te trzy elementy w kolejności, w
jakiej znajdują się w bazie, lub posortowane według wartości któregoś z
atrybutów (rosnąco / malejąco). Posiadamy więc elementy, które
chcieliśmy, ale nie są one ustawione tak jak chcieliśmy.

Zacznijmy jednak od stworzenia dql, które umożliwi nam właśnie pobranie
elementów, które chcieliśmy (posortowanie ich tak jak chcieliśmy nastąpi
później):

::

    class MyModelTable extends Doctrine_Table
    {
        /**
        * Returns elements based on given ids
        * @param array $element_ids
        * @return Doctrine_Query
        */
        public function getElementsByIdsQuery( $element_ids )
        {
            return $this->createQuery( 'e' )
                ->select( 'e.*' )
                ->whereIn( 'e.id', $element_ids );
        }

    }

To zapytanie zapewnia podstawę, którą możemy wykorzystać bez
konieczności przechodzenia przez następny krok. Do posortowania
elementów wykorzystamy instrukcję warunkową CASE:

::

    class MyModelTable extends Doctrine_Table
    {

        /**
        ...
        */

        /**
        * Returns elements based on given ids, ordered as in given array.
        * @param array $element_ids
        * @return Doctrine_Query
        */
        public function getElementsByIdsOrderedQuery( $element_ids )
        {
            $query = $this->getElementsByIdsQuery($element_ids);
            $orderCASE = '';
            foreach( $element_ids as $order => $id )
            {
                $orderCASE .= 'WHEN '.$order.' THEN '.$id.' ';
            }

            return $query->addSelect( '(CASE e.id '.$orderCASE.' ELSE 0 END) as order' )
                 ->orderBy( 'order ASC' );
        }
    }

Tak otrzymany dql zwraca nam obiekty ustawione w takiej samej
kolejności, jak w zadanej tablicy identyfikatorów.

Możemy się jednak spodziewać wystąpienia paru błędów i niezamierzonych
działań naszego kodu.

-  W przypadku braku elementów w tablicy $element\_ids (pusta tablica),
   zapytanie podstawowe zwróci nam wszystkie elementy z tabeli.
-  Natomiast próba wykonania DQL z metody getElementsByIdsOrderedQuery
   zwróci nam błąd, gdyż w przypadku braku elementów w tablicy
   $element\_ids addSelect będzie wyglądał następująco:

   ::

       '(CASE e.id  ELSE 0 END) as order'

O ile pierwszy problem, zależnie od intencji programisty może być
wynikiem pożądanym, o tyle drugi problem nie ucieszy nikogo.

Zabezpieczyć się przed tym drugim problemem można w następujący sposób:

::

    if( count( $element_ids ) > 0 )
    {
        $orderCASE = '';
        foreach( $element_ids as $order => $id )
        {
            $orderCASE .= 'WHEN '.$order.' THEN '.$id.' ';
        }

        return $query->addSelect( '(CASE e.id '.$orderCASE.' ELSE 0 END) as order' );
    }

W tym wypadku, jeśli tablica będzie pusta, do zapytania dql nie zostanie
dodana instrukcja case. Należy jednak zwrócić uwagę na brak w tej pętli
instrukcji orderBy. Została ona pominięta celowo, by zwiększyć
elastyczność rozwiązania i zademonstrować kolejną pułapkę.

Elastyczność polega na możliwości zmiany sortowania dynamicznie. Można
zmienić kierunek, lub nawet atrybut, po którym sortujemy.

Natomiast zawarta pułapka w momencie przekazania pustej tablicy i
jednoczesnej próbie posortowania po atrybucie order (którego po prostu
nie będzie) doprowadzi do wystąpienia błędu bazy danych. By pozbyć się
tego ostatniego błędu, należy dodać atrybut order z ustawioną na sztywno
wartością:

::

    else
    {
        $query->addSelect( '\'1\' as order' );
    }

