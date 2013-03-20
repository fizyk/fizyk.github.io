.. title: Nie wierz migracjom
.. slug: nie-wierz-migracjom
.. date: 2010/05/16 21:05:42
.. tags: symfony, doctrine, migracje
.. link:
.. description: Migracje doctrinowe są narzędziem, które ma nam ułatwić wersjonowanie bazy danych. Dzięki nim można po zmianie schematu zmienić zarówno bazę na maszynie developerskiej, a później powtórzyć zmiany na produkcyjnej. Ale to narzędzie ma tylko ułatwić, nie wyręczyć. Wygeneruje klasy migracyjne ale na z góry określonych zasadach. Najpierw operacje na tabelach, później klucze i indeksy:

Migracje doctrinowe są narzędziem, które ma nam ułatwić wersjonowanie
bazy danych. Dzięki nim można po zmianie schematu zmienić zarówno bazę
na maszynie developerskiej, a później powtórzyć zmiany na produkcyjnej.
Ale to narzędzie ma tylko ułatwić, nie wyręczyć. Wygeneruje klasy
migracyjne ale na z góry określonych zasadach. Najpierw operacje na
tabelach, później klucze i indeksy:

::

    class Version12 extends Doctrine_Migration_Base
    {
        public function up()
        {
            $this->createTable('model_a', array(
                 'id' => 
                 array(
                  'type' => 'integer',
                  'length' => '8',
                  'autoincrement' => '1',
                  'primary' => '1',
                 ),
                 'name' => 
                 array(
                  'type' => 'string',
                  'length' => '255',
                 ),
                 ), array(
                 'primary' => 
                 array(
                  0 => 'id',
                 ),
                 'collate' => 'utf8_general_ci',
                 'charset' => 'utf8',
                 ));
            $this->createTable('model_b', array(
                 'id' => 
                 array(
                  'type' => 'integer',
                  'length' => '8',
                  'autoincrement' => '1',
                  'primary' => '1',
                 ),
                 'name' => 
                 array(
                  'type' => 'string',
                  'length' => '255',
                 ),
                 'a_id' => 
                 array(
                  'type' => 'integer',
                  'length' => '8',
                 ),
                 ), array(
                 'primary' => 
                 array(
                  0 => 'id',
                 ),
                 'collate' => 'utf8_general_ci',
                 'charset' => 'utf8',
                 ));
        }

        public function down()
        {
            $this->dropTable('model_a');
            $this->dropTable('model_b');
        }
    }

    class Version13 extends Doctrine_Migration_Base
    {
        public function up()
        {
            $this->createForeignKey('model_b', 'model_b_a_id_model_a_id', array(
                 'name' => 'model_b_a_id_model_a_id',
                 'local' => 'a_id',
                 'foreign' => 'id',
                 'foreignTable' => 'model_a',
                 ));
            $this->addIndex('model_b', 'model_b_a_id', array(
                 'fields' => 
                 array(
                  0 => 'a_id',
                 ),
                 ));
        }

        public function down()
        {
            $this->dropForeignKey('model_b', 'model_b_a_id_model_a_id');
            $this->removeIndex('model_b', 'model_b_a_id', array(
                 'fields' => 
                 array(
                  0 => 'a_id',
                 ),
                 ));
        }
    }

Podejście to jest jak najbardziej w porządku, gdy dodajemy elementy do
naszej struktury. Jeśli od niej coś odejmujemy, wygenerowane migracje
następują w tej samej kolejności! Najpierw tabele, lub pola, są usuwane
z bazy, a następnie usuwane są klucze obce i indeksy. Analogicznie
wygenerowana migracja w operacji w dół próbuje najpierw stworzyć klucze
obce, później dopiero tabelę.

::

    class Version14 extends Doctrine_Migration_Base
    {
        public function up()
        {
            $this->dropTable('model_a');
        }

        public function down()
        {
            $this->createTable('model_a', array(
                 'id' => 
                 array(
                  'type' => 'integer',
                  'length' => '8',
                  'autoincrement' => '1',
                  'primary' => '1',
                 ),
                 'name' => 
                 array(
                  'type' => 'string',
                  'length' => '255',
                 ),
                 ), array(
                 'type' => '',
                 'indexes' => 
                 array(
                 ),
                 'primary' => 
                 array(
                  0 => 'id',
                 ),
                 'collate' => 'utf8_general_ci',
                 'charset' => 'utf8',
                 ));
        }
    }

    class Version15 extends Doctrine_Migration_Base
    {
        public function up()
        {
            $this->dropForeignKey('model_b', 'model_b_a_id_model_a_id');
        }

        public function down()
        {
            $this->createForeignKey('model_b', 'model_b_a_id_model_a_id', array(
                 'name' => 'model_b_a_id_model_a_id',
                 'local' => 'a_id',
                 'foreign' => 'id',
                 'foreignTable' => 'model_a',
                 ));
        }
    }

Nie byłoby tragicznie, gdyby operacja migrowania była objęta transakcją,
problem jest taki, że nie jest. I tak, jeśli uruchomimy błędną migrację,
wykona nam ona wszystko co może, nawet, jeśli po drodze napotka błędy. W
takim wypadku zostaniemy z, delikatnie mówiąc, rozsynchronizowaną bazą
danych. By doprowadzić ją do porządku, konieczne jest poświęcenie więcej
uwagi bazie, niż początkowo miało się na to nadzieję.

Pracując z migracjami, należy mieć na uwadze, iż narzędzie to ma nam,
programistom czy projektantom pomóc w pracy, nie nas wyręczyć. Każdą
migrację po wygenerowaniu powinno się dokładnie obejrzeć i być może
poprawić lub dopisać np. działanie na danych.

Przed wgryzieniem się w migracje warto przeczytać również `dokumentację
doctrine na temat
migracji <http://www.doctrine-project.org/projects/orm/1.2/docs/manual/migrations/en#migrations>`_.
