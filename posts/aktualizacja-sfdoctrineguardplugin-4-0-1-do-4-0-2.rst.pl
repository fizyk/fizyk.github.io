.. title: Aktualizacja sfDoctrineGuardPlugin 4.0.1 do 5.0.0
.. slug: aktualizacja-sfdoctrineguardplugin-4-0-1-do-4-0-2
.. date: 2010/07/18 23:07:58
.. tags: symfony, doctrine, sfForkedDoctrineApply, migracje, php, sfDoctrineGuard, doctrine migration
.. link:
.. description: W tygodniu pojawiła się nowa wersja pluginu sfDoctrineGuardPlugin. Nie przywiązywałem do tego większej wagi, ze względu na changelog, który informował tylko o poprawce generowania kluczy "pamiętaj mnie" (ang. Remember Me).

W tygodniu pojawiła się nowa wersja pluginu sfDoctrineGuardPlugin.
[STRIKEOUT:Nie przywiązywałem do tego większej wagi, ze względu na
changelog, który informował tylko o poprawce generowania kluczy
"pamiętaj mnie" *(ang. Remember Me)*].

Niestety, aktualizacja pluginu z wersji **4.0.1** do
[STRIKEOUT:**4.0.2**] **5.0.0** powoduje raczej niemiłe przeżycia.
Okazuje się, że pomimo oznaczenia aktualizacji jako mniejszej, w nowej
wersji pluginu mamy całą zawartość dotychczasowego trunka svn pluginu, a
co za tym idzie zmienia się wielkość pola id z integer(4) na integer(8)
(czyli bigint).

Najpierw zaadresujmy problem zmiany długości klucza. Jeśli mamy jakieś
klucze obce do **sfGuardUser**, najpierw powinniśmy je tymczasowo
zrzucić (np. zakomentować fragmenty pliku **schema.yml** odpowiedzialne
za stworzenie relacji).

Poniżej przykładowa klasa migracyjna:

::

    class Version14 extends Doctrine_Migration_Base
    {
        public function up()
        {

            $this->dropForeignKey('sf_guard_user_profile', 'sf_guard_user_profile_user_id_sf_guard_user_id');
        }

        public function down()
        {
            $this->createForeignKey('sf_guard_user_profile', 'sf_guard_user_profile_user_id_sf_guard_user_id', array(
                 'name' => 'sf_guard_user_profile_user_id_sf_guard_user_id',
                 'local' => 'user_id',
                 'foreign' => 'id',
                 'foreignTable' => 'sf_guard_user',
                 'onUpdate' => '',
                 'onDelete' => 'cascade',
                 ));
        }
    }

Niestety, dotyczy to również obiektów natywnych dla **sfGuardPlugin**, z
tym, że w relacjach pomiędzy tymi obiektami musimy zakomentować
wszystkie relacje.

Tak więc ostatecznie ta migracja powinna wyglądać mniej więcej tak:

::

    class Version14 extends Doctrine_Migration_Base
    {
        public function up()
        {
            $this->dropForeignKey('sf_guard_user_profile', 'sf_guard_user_profile_user_id_sf_guard_user_id');
            $this->dropForeignKey('sf_guard_group_permission', 'sf_guard_group_permission_group_id_sf_guard_group_id');
            $this->dropForeignKey('sf_guard_group_permission', 'sf_guard_group_permission_permission_id_sf_guard_permission_id');
            $this->dropForeignKey('sf_guard_remember_key', 'sf_guard_remember_key_user_id_sf_guard_user_id');
            $this->dropForeignKey('sf_guard_user_group', 'sf_guard_user_group_user_id_sf_guard_user_id');
            $this->dropForeignKey('sf_guard_user_group', 'sf_guard_user_group_group_id_sf_guard_group_id');
            $this->dropForeignKey('sf_guard_user_permission', 'sf_guard_user_permission_user_id_sf_guard_user_id');
            $this->dropForeignKey('sf_guard_user_permission', 'sf_guard_user_permission_permission_id_sf_guard_permission_id');
        }

        public function down()
        {
            $this->createForeignKey('sf_guard_user_profile', 'sf_guard_user_profile_user_id_sf_guard_user_id', array(
                 'name' => 'sf_guard_user_profile_user_id_sf_guard_user_id',
                 'local' => 'user_id',
                 'foreign' => 'id',
                 'foreignTable' => 'sf_guard_user',
                 'onUpdate' => '',
                 'onDelete' => 'cascade',
                 ));
            $this->createForeignKey('sf_guard_group_permission', 'sf_guard_group_permission_group_id_sf_guard_group_id', array(
                 'name' => 'sf_guard_group_permission_group_id_sf_guard_group_id',
                 'local' => 'group_id',
                 'foreign' => 'id',
                 'foreignTable' => 'sf_guard_group',
                 'onUpdate' => '',
                 'onDelete' => 'CASCADE',
                 ));
            $this->createForeignKey('sf_guard_group_permission', 'sf_guard_group_permission_permission_id_sf_guard_permission_id', array(
                 'name' => 'sf_guard_group_permission_permission_id_sf_guard_permission_id',
                 'local' => 'permission_id',
                 'foreign' => 'id',
                 'foreignTable' => 'sf_guard_permission',
                 'onUpdate' => '',
                 'onDelete' => 'CASCADE',
                 ));
            $this->createForeignKey('sf_guard_remember_key', 'sf_guard_remember_key_user_id_sf_guard_user_id', array(
                 'name' => 'sf_guard_remember_key_user_id_sf_guard_user_id',
                 'local' => 'user_id',
                 'foreign' => 'id',
                 'foreignTable' => 'sf_guard_user',
                 'onUpdate' => '',
                 'onDelete' => 'CASCADE',
                 ));
            $this->createForeignKey('sf_guard_user_group', 'sf_guard_user_group_user_id_sf_guard_user_id', array(
                 'name' => 'sf_guard_user_group_user_id_sf_guard_user_id',
                 'local' => 'user_id',
                 'foreign' => 'id',
                 'foreignTable' => 'sf_guard_user',
                 'onUpdate' => '',
                 'onDelete' => 'CASCADE',
                 ));
            $this->createForeignKey('sf_guard_user_group', 'sf_guard_user_group_group_id_sf_guard_group_id', array(
                 'name' => 'sf_guard_user_group_group_id_sf_guard_group_id',
                 'local' => 'group_id',
                 'foreign' => 'id',
                 'foreignTable' => 'sf_guard_group',
                 'onUpdate' => '',
                 'onDelete' => 'CASCADE',
                 ));
            $this->createForeignKey('sf_guard_user_permission', 'sf_guard_user_permission_user_id_sf_guard_user_id', array(
                 'name' => 'sf_guard_user_permission_user_id_sf_guard_user_id',
                 'local' => 'user_id',
                 'foreign' => 'id',
                 'foreignTable' => 'sf_guard_user',
                 'onUpdate' => '',
                 'onDelete' => 'CASCADE',
                 ));
            $this->createForeignKey('sf_guard_user_permission', 'sf_guard_user_permission_permission_id_sf_guard_permission_id', array(
                 'name' => 'sf_guard_user_permission_permission_id_sf_guard_permission_id',
                 'local' => 'permission_id',
                 'foreign' => 'id',
                 'foreignTable' => 'sf_guard_permission',
                 'onUpdate' => '',
                 'onDelete' => 'CASCADE',
                 ));
        }
    }

Jeśli projekt był już w użyciu od jakiegoś czasu i w bazie istnieją już
użytkownicy, to ważne, by w początkowym okresie dodać następujący
fragment do swojego **schema.yml**:

::

    sfGuardUser:
      columns:
        email_address:
          type: string(255)
          notnull: false
          unique: true

Domyślnie pole to jest ustawione jako **notnull: true**, i migracja nie
ma szans powodzenia jeśli istnieją już rekordy w tabeli **sfGuardUser**.

Na sam koniec należy odkomentować wszelkie relacje (ale wcześniej
zmienić definicje typów powiązanych do **sfGuardUser**):

::

    class Version17 extends Doctrine_Migration_Base
    {
        public function up()
        {
            $this->createForeignKey('comment', 'comment_user_id_sf_guard_user_id', array(
                 'name' => 'comment_user_id_sf_guard_user_id',
                 'local' => 'user_id',
                 'foreign' => 'id',
                 'foreignTable' => 'sf_guard_user',
                 ));
            $this->createForeignKey('sf_guard_user_profile', 'sf_guard_user_profile_user_id_sf_guard_user_id', array(
                 'name' => 'sf_guard_user_profile_user_id_sf_guard_user_id',
                 'local' => 'user_id',
                 'foreign' => 'id',
                 'foreignTable' => 'sf_guard_user',
                 'onUpdate' => '',
                 'onDelete' => 'cascade',
                 ));
            $this->createForeignKey('sf_guard_forgot_password', 'sf_guard_forgot_password_user_id_sf_guard_user_id', array(
                 'name' => 'sf_guard_forgot_password_user_id_sf_guard_user_id',
                 'local' => 'user_id',
                 'foreign' => 'id',
                 'foreignTable' => 'sf_guard_user',
                 'onUpdate' => '',
                 'onDelete' => 'CASCADE',
                 ));
            $this->createForeignKey('sf_guard_remember_key', 'sf_guard_remember_key_user_id_sf_guard_user_id', array(
                 'name' => 'sf_guard_remember_key_user_id_sf_guard_user_id',
                 'local' => 'user_id',
                 'foreign' => 'id',
                 'foreignTable' => 'sf_guard_user',
                 'onUpdate' => '',
                 'onDelete' => 'CASCADE',
                 ));
            $this->addIndex('sf_guard_forgot_password', 'sf_guard_forgot_password_user_id', array(
                 'fields' => 
                 array(
                  0 => 'user_id',
                 ),
                 ));
        }

        public function down()
        {
            $this->dropForeignKey('comment', 'comment_user_id_sf_guard_user_id');
            $this->dropForeignKey('sf_guard_user_profile', 'sf_guard_user_profile_user_id_sf_guard_user_id');
            $this->dropForeignKey('sf_guard_forgot_password', 'sf_guard_forgot_password_user_id_sf_guard_user_id');
            $this->dropForeignKey('sf_guard_remember_key', 'sf_guard_remember_key_user_id_sf_guard_user_id');
            $this->removeIndex('sf_guard_forgot_password', 'sf_guard_forgot_password_user_id', array(
                 'fields' => 
                 array(
                  0 => 'user_id',
                 ),
                 ));
        }
    }

[STRIKEOUT:Koniec końców, wypuszczenie pluginu w taki sposób to jest
niestety porażka. Jak na "małą" aktualizację wersji, brakuje
zdecydowanie wstecznej kompatybilności, a i changelog jest zdecydowanie
potraktowany po macoszemu. Plugin powinien być wydany co najmniej jako
wersja 4.1.0].

[STRIKEOUT:Przy okazji wydanie\ ** sfForkedDoctrineApply** 1.3.0 trochę
się opóźni, trzeba będzie dostosować do nowej wersji doctrine guarda.]

Po paru wiadomościach na grupie symfony Jonathan Wage poprawił paczki z
pluginami.
