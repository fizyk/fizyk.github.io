.. title: Python, i wszystko jest obiektem
.. tags: python,programowanie,oop
.. date: 2013/07/08 21:21:33
.. slug: python-i-wszystko-jest-obiektem
.. link:
.. description: W pythonie wszystko jest obiektem.

Jakiś czas temu wpisałem sobie konsoli pythonowej wypisałem metody instancj inta za pomocą funkcji dir:

.. code-block:: python

    >>> dir(1)
    ['__abs__', '__add__', '__and__', '__class__', '__cmp__', '__coerce__', '__delattr__', '__div__', '__divmod__', '__doc__', '__float__', '__floordiv__', '__format__', '__getattribute__', '__getnewargs__', '__hash__', '__hex__', '__index__', '__init__', '__int__', '__invert__', '__long__', '__lshift__', '__mod__', '__mul__', '__neg__', '__new__', '__nonzero__', '__oct__', '__or__', '__pos__', '__pow__', '__radd__', '__rand__', '__rdiv__', '__rdivmod__', '__reduce__', '__reduce_ex__', '__repr__', '__rfloordiv__', '__rlshift__', '__rmod__', '__rmul__', '__ror__', '__rpow__', '__rrshift__', '__rshift__', '__rsub__', '__rtruediv__', '__rxor__', '__setattr__', '__sizeof__', '__str__', '__sub__', '__subclasshook__', '__truediv__', '__trunc__', '__xor__', 'bit_length', 'conjugate', 'denominator', 'imag', 'numerator', 'real']

Spodziewałem się tego, choć chyba nie aż takiej ilości atrybutów. Instancja integera ma 64 metody i atrybuty. Parę kolejnych przykładów:


.. code-block:: python

    >>> len(dir(int))
    64
    >>> len(dir(str))
    71
    >>> len(dir(bool))
    64
    >>> len(dir(isinstance))
    26
    >>> len(dir(dir))
    26
    >>> len(dir(len))
    26

I niespodzianka:

.. code-block:: python

    >>> len(dir(print))
      File "<stdin>", line 1
        len(dir(print))
                ^
    SyntaxError: invalid syntax

W zasadzie nie wiem, czego się spodziewałem.... chociaż, sprawdźmy w paythonie 3.3:

.. code-block:: python

    Python 3.3.1 (default, Apr 17 2013, 22:30:32)
    [GCC 4.7.3] on linux
    Type "help", "copyright", "credits" or "license" for more information.
    >>> len(dir(print))
    27

Tak, w pythonie 3, print jest już normalną funkcją.
