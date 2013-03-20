.. title: sfForkedDoctrineApply
.. slug: sfforkeddoctrineapplyplugin-wypuszczony
.. date: 2010/03/21 23:03:38
.. tags: symfony, sfDoctrineApply, plugin, sfForkedDoctrineApply
.. link:
.. description: Miniony tydzień upłynął mi głównie na poprawianiu pluginu do symfony sfForkedDoctrineApplyPlugin, który powstał na bazie sfDoctrineApplyPlugin.

Miniony tydzień upłynął mi głównie na poprawianiu pluginu do symfony
`sfForkedDoctrineApplyPlugin <http://www.symfony-project.org/plugins/sfForkedDoctrineApplyPlugin>`_,
który powstał na bazie
`sfDoctrineApplyPlugin <http://www.symfony-project.org/plugins/sfDoctrineApplyPlugin>`_.

Oba pluginy, zarówno oryginał, jak i fork, dostarczają możliwość
rejestracji nowych użytkowników, resetowanie i zmianę hasła, a także
możliwość edycji skromnego profilu. Główną różnicą jest to, że
oryginalny plugin, napisany przez ludzi z
`punkavee <http://www.punkave.com/>`_, tworzących cms
`apostrophe <http://www.apostrophenow.com/>`_, wykorzystuje bibliotekę
Zend\_Mail do wysyłania maili potwierdzających, natomiast fork, dzięki
pracy włożonej przez Stephena
(`stephenrs <http://forum.symfony-project.org/index.php/u/11253/>`_),
używa dostarczonej wraz z symfony biblioteki `Swift
Mailer <http://swiftmailer.org/>`_. Ale o tym już pisałem poprzednio.

Ponieważ sama zmiana biblioteki mailującej to mało, w forku znajdzie się
proste dziedziczenie doctrine (simple inheritance), a także polskie
tłumaczenie (stringi i18n). Dodatkowo, w forku zalogowany użytkownik
może zmienić hasło bez oczekiwania na email, a same emaile zawierają dwa
razy dłuższy kod potwierdzający. W planach jest dostarczenie jeszcze
kilku funkcjonalności, ale o tym pisze już w
`README <http://www.symfony-project.org/plugins/sfForkedDoctrineApplyPlugin/1_0_0?tab=plugin_readme>`_
forka.
