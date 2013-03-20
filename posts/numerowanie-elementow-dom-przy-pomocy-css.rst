.. title: Numerowanie elementów DOM przy pomocy CSS
.. slug: numerowanie-elementow-dom-przy-pomocy-css
.. date: 2012/09/06 22:09:52
.. tags: css
.. link:
.. description: W CSS2 istnieje prosty sposób, na stworzenie listy numerowanej, bez użycia znacznika list. Sposób ten pozwala również rozszerzyć same listy.

W CSS2 istnieje prosty sposób, na stworzenie listy numerowanej, bez
użycia znacznika list. Sposób ten pozwala również rozszerzyć same listy.

By osiągnąć efekt listy numerowanej, konieczne jest użycie trzech
właściwości CSS:

-  counter-reset
-  counter-increment
-  content wraz z funkcją counter

**counter-reset** informuje w jakich warunkach licznik jest resetowany:
  

::

    .reset
    {
      counter-reset: licznik;
    }

**counter-increment** podnosi wartosć licznika:
  

::

    .increment
    {
      counter-increment: licznik;
    }

Natomiast **content** wraz z funkcją counter wyświetla w odpowiednim
miejscu wartość licznika. Dlatego najlepiej umieścić tą właściwość w
definicji z selektorem **:before**

::

    .count-me:before
    {
      counter-increment: licznik
      content: counter(licznik);
    }

Metoda content potrafi wyświetlić również ciąg znaków, a nawet dwa
liczniki, dlatego też można wyświetlić coś takiego:

::

    .count-me-too:before
    {
      counter-increment: licznik
      content: "Art. " counter(licznik) ". ";
    }

