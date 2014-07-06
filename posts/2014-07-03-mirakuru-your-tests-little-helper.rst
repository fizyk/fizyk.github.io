.. title: mirakuru, your tests little helper
.. slug: mirakuru-your-tests-little-helper
.. date: 2014-07-03 20:19:11 UTC+02:00
.. tags: python, testing, mirakuru,
.. link:
.. description: mirakuru 0.1.0 announcement.
.. type: text

Just yesterday, we released first version of mirakuru.
Mirakuru is a helpful tools that lets add superpowers to Your tests, or maybe
other scripts that need other processes to run.

With few lines of code, mirakuru guarantees, that when running, your script will
start it's own database instance, or the webserver you've just wrote, and need
to test it by sending real requests to it - automatically.

.. TEASER_END

mirakuru is a fork of a `summon_process <https://github.com/mlen/summon_process>`_
library, we use a lot in both our tests, and `pytest-dbfixture <https://github.com/ClearcodeHQ/pytest-dbfixtures>`_ package, and it coded to work both in
python 2.7, 3.2, 3.3 and 3.4. We also simplified package structure, api,
striped some specialized context manager code and change packages's  that,
in our opinion better reflect it's character and dangers it brings.

Why the `mirakuru` name then?
+++++++++++++++++++++++++++++

If you've seen `Arrow <http://www.imdb.com/title/tt2193021/>`_ TV series,
you'll already know, if You haven't, mirakuru was a substance, a super-soldier
serum invented by Japanese scientists during World War II.
It gave injected person a super human abilities, speed, reflex, strength,
healing - (Something like Cpt. America from Marvel's Universe).
And just as **mirakuru** there, this package, will allow your tests to run
without You to care about database service being running on your test machine.

But **mirakuru** there had also a side effect, their user was rendered emotionally
unstable, unpredictable, and hallucinating. And same here, You've got to watch
on how many processes you start, and what they're doing.

It might also make writing integration tests much easier than unittest,
but as long as they work, you might forget that it's easier and faster to fix
some behaviour on unittest than on integration with several subprocesses.
Or make you focus on completely irrelevant part of your code.

By using **mirakuru**, all you need to provide for CI machine are database servers
executables. They'll be started along your test suite, and configured accordingly.

How does it work?
+++++++++++++++++

Without further babling, here's example from mirakuru's readme:

.. code-block:: python

    from mirakuru import HTTPExecutor
    from httplib import HTTPConnection, OK


    def test_it_works():
        executor = HTTPExecutor("./server", url="http://localhost:6543/")

        # start and wait for it to run
        executor.start()
        # should be running!
        conn = HTTPConnection("localhost", 6543)
        conn.request('GET', '/')
        assert conn.getresponse().status is OK
        executor.stop()

What we did here:

#. We told executor how to start our webapp, and what http address it'll be using to receive requests.
#. Then we start the executor.
    #. Executor first started the process
    #. Then, determined, if executor is accepting requests on hostname and port extracted from url.
    #. Once the process accepts connections, executors tries to make a successful HEAD request on url.
    #. And only after the HEAD request is successful, tests continue, and we can interact with running application underneath.

Timeout `mirakuru` uses, is configurable, so executor might wait 20 seconds,
2 minutes, or indefinitely. And same goes for stopping process.

Whenever Timeout is exceeded, both actions rises TimeoutException error.

What after that?
++++++++++++++++

Apart from some minor enhancements, we're considering adding specialized executors
for databases, or queue systems.

It could also provide a command line utility that would be able to start
processes based on configuration, and tests written in other language
(or one that does not use mirakuru directly).

Links:
++++++

Links where mirakuru is accessible:

#. `mirakuru @ pypi <https://pypi.python.org/pypi/mirakuru/0.1.1>`_
#. `mirakuru @ readthedocs <http://mirakuru.readthedocs.org/>`_
#. `mirakuru @ github <https://github.com/ClearcodeHQ/mirakuru>`_

.. note::

    **Edit (2014-07-06)**

    As I read few months ago about releasing packages, almost every package,
    library out there, has some commit named **fixed MANIFEST.in** or something
    similar related to fixing package or distribution.

    Mirakuru is not an exception in this regards. Although wheel was installing
    just fine, I forgot to include CHANGES.rst file for package even though
    included it in setup.py's *long_description* argument, which in return caused
    errors when installing mirakuru from source distribution.




