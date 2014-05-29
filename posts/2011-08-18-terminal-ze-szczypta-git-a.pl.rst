.. title: terminal ze szczyptą git'a
.. slug: terminal-ze-szczypta-git-a
.. date: 2011/08/18 20:08:23
.. tags: linux, git, terminal, bash
.. link:
.. description: Kto dłużej popracował na Linuksie, wie, jak przydatny czasem potrafi bywać terminal. Dla mnie, jako programisty, równie przydatnym narzędziem jest git, z którego korzystam właśnie przez terminal.

Kto dłużej popracował na Linuksie, wie, jak przydatny czasem potrafi
bywać terminal. Dla mnie, jako programisty, równie przydatnym narzędziem
jest git, z którego korzystam właśnie przez terminal.

Jedyny problem z takim połączeniem jest to, że czasem trudno zorientować
się od razu, w jakiej gałęzi kodu pracujemy, oczywiście, jeśli
korzystamy z gałęzi intensywnie. Ale jest na to sposób. Wystarczy lekko
zmodyfikować plik **.bashrc** dodając linijkę:

.. code-block:: bash

    export PS1='\u@\h: \w$(__git_ps1 "(%s)")$ '

Jedyny problem z takim rozwiązaniem jest taki, że modyfikuje tytuł okna
xterminala. Aby zaradzić temu, trzeba dodać jeszcze takie linijki:

.. code-block:: bash

    case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"

