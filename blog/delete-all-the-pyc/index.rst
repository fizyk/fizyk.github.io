.. title: Delete all the .pyc!
.. slug: delete-all-the-pyc
.. date: 2013/04/02 18:14:49
.. tags: tip,python,bash
.. link:
.. description: A tip to remove leftoer .pyc files.


How to remove leftover .pyc files, when your editor doesn't provide such option? Run simple bash command.

.. TEASER_END

I've been using it for some time, stareted with this:

.. code-block:: bash

    find . -name "*.pyc" -exec rm -rf {} \;

But it can be run much simpler:

.. code-block:: bash

    find . -name "*.pyc" -delete

And finally, it also can be assigned to bash alias:

.. code-block:: bash

    alias delpyc='find . -name "*.pyc" -delete'

