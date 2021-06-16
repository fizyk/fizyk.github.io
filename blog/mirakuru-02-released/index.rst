.. title: mirakuru 0.2 released
.. slug: mirakuru-02-released
.. date: 2014-08-16 21:21:07 UTC+02:00
.. tags: python, testing, mirakuru,
.. link:
.. description:
.. type: text

Last Thursday, we released new minor version of mirakuru.
Mirakuru is a helpful tools that lets add superpowers to Your tests, or maybe
other scripts that need other processes to run.

**Changes introduced to mirakuru 0.2 - are:**

* context managers (for both starting and stopping)
* ability to detect if resources required by executors (TCP or HTTP) aren't already used.
* and a fix, for killing executors started with their own shell.

.. TEASER_END

Context managers
++++++++++++++++

Context managers are reintroduced, since we removed "*orchestrators*" when we
forked mirakuru form original code base -
`summon_process <https://github.com/mlen/summon_process>`_.
"Orchestrators", as summon_processes called its specially crafted context managers,
weren't general enough, and would require writing new context manager for new cases.

AlreadyRunning exception
++++++++++++++++++++++++

Ability to detect the possibility to start executor - this feature comes from
our testing environment, where a process leaked from test run, that has been
forcefully stopped. We spend some time investigating, because error we got wasn't
informative at all. Currently, TCPExecutor and HTTPExecutor will raise
`mirakuru.exception.AlreadyRunning` exception.

Stopping executors with their own shell
+++++++++++++++++++++++++++++++++++++++

And the last one, is a well known issue, when starting subprocesses with
**shell** arg set to True. This makes subprocess to be started in it's own shell,
but unfortunately, when You want to kill the process in normal way, let say like that:

.. code-block:: python

    import subprocess

    awsome_process = subprocess.Popen(
        './start_me.py --run_forever', shell=True)

    awsome_process.terminate()

Killing subprocess here only kills shell subprocess have been started in -
effectively leaking it. Solution is to set a process group id - but that might
be changed while the processes are running, or better solution, to set session id:

.. code-block:: python


    import os
    import signal
    import subprocess

    awsome_process = subprocess.Popen(
        './start_me.py --run_forever',
        preexec_fn=os.setsid, shell=True)


    os.killpg(awsome_process.pid, signal.SIGTERM)

Mirakuru's executors will now do that out of the box.


Links
+++++

Links where mirakuru can be found:

#. `mirakuru @ pypi <https://pypi.python.org/pypi/mirakuru/0.2.0>`_
#. `mirakuru @ readthedocs <http://mirakuru.readthedocs.org/>`_
#. `mirakuru @ github <https://github.com/ClearcodeHQ/mirakuru>`_


