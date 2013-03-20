.. title: fzTagPlugin, łatwość tagowania jak w Diem CMF
.. slug: fztagplugin-latwosc-tagowania-jak-w-diem-cmf
.. date: 2010/04/27 21:04:19
.. tags: symfony, plugin, diem, dmTag, fzTag
.. link:
.. description: dmTagPlugin zrobił na mnie spore wrażenie, gdy pierwszy raz go testowałem i badałem jego funkcjonalność na potrzeby innej, dość podobnej funkcjonalności z projektu realizowanego w firmie. Wrażenie na mnie zrobił przede wszystkim FCBKcomplete użyty w widgecie, a także w miarę badania, bądź co bądź niedużego kodu, wstrzykiwanie widgetu i walidatora odpowiedzialnego za operacje na tagach do formularza. Bije to inne możliwości tagowania, które widziałem w symfony na głowę.

`dmTagPlugin <http://diem-project.org/plugins/dmtagplugin>`_ zrobił na
mnie spore wrażenie, gdy pierwszy raz go testowałem i badałem jego
funkcjonalność na potrzeby innej, dość podobnej funkcjonalności z
projektu realizowanego w firmie. Wrażenie na mnie zrobił przede
wszystkim
`FCBKcomplete <http://www.emposha.com/javascript/fcbkcomplete.html>`_
użyty w widgecie, a także w miarę badania, bądź co bądź niedużego kodu,
wstrzykiwanie widgetu i walidatora odpowiedzialnego za operacje na
tagach do formularza. Bije to inne możliwości tagowania, które widziałem
w symfony na głowę.

Dlatego też postanowiłem backportować ten plugin z `Diem
CMF <http://diem-project.org>`_  z powrotem do symfony. Nie było to
takie proste, jak się spodziewałem, w związku z czym zajęło mi to trochę
dłużej, niż powinno, ale efekt jest zadowalający. Mogę teraz powiedzieć,
że poznałem dmTagPlugin niemal od podszewki. Dodatkowo udaje mi się
wstrzyknąć pole do obsługi tagów nawet w aplikacji frontendowej. Będzie
trzeba to ograniczyć jakimś ustawieniem.

`fzTagPlugin <http://www.symfony-project.org/plugins/fzTagPlugin>`_ jest
dosŧępny już w wersji 1.0.3, głownie za sprawę paru moich pomyłek i
jednego błędu. Ponieważ niedawno zalogowałem się na
`githubie <http://github.com>`_, można tam teraz zgłaszać `błędy i
pomysły <http://github.com/fizyk/fzTagPlugin/issues>`_ na nowe
funkcjonalności. Przeniosłem tam też repozytorium. Sama paczka jest jak
zwykle w repozytorium
`pluginów <http://www.symfony-project.org/plugins/fzTagPlugin>`_ na
stronie `symfony <http://symfony-project.org>`_.
