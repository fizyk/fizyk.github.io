.. link:
.. tags: tip,terminal
.. date: 2013/12/11 22:07:24
.. title: How to kill a process hanging on a port
.. slug: how-to-kill-a-process-hanging-on-a-port
.. description:

Sometimes when you develop, you might find yourself with strange error. It says that the process you're trying to start is trying to use port, that is already being used. It's strange, because it is usually You, who used this port on previous run. If that's the case, then **fuser** command should relieve you from this error.

For example:

.. code-block:: bash

    fuser 6543/tcp -k

The **k** parameter is responsible for actual killing. Without it, the command would just identify which process is using port/socket in question.
