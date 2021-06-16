.. title: My first bump with pypy
.. slug: my-first-bump-with-pypy
.. date: 2014-08-21 22:34:42 UTC+02:00
.. tags: python,pypy
.. link:
.. description:
.. type: text

Just until two weeks ago, I was only reading about PyPy. My though about it was somewhat simple: that's the interpreter, that speeds up python code. I expected that some changes to python code, that's supposed to run in PyPy will be required, but I thought it will be easy to spot. I haven't been more wrong.

.. TEASER_END

I wanted to add PyPy's interpreters to mirakuru's tests on travis. I thought, that it will be more or less enough, to add PyPy and PyPy3 to travis.yml file. Well... One of the tests hanged, and I had no idea why.

For this test, we start a SimpleHTTPServer that's available in python, and wait, till it is started. But before it starts, be wait at the subprocess for 3 seconds.

.. code-block:: python

    command = 'bash -c "sleep 3 && python -m SimpleHTTPServer 7897"'

    executor = HTTPExecutor(
        command, 'http://127.0.0.1:7897/'
        timeout=20
    )
    executor.start()

Inside of HTTPExecutor we've been waiting for process, to start responding on TCP connection first at the host and port in address passed to Executor:

.. code-block:: python

    try:
        sock = socket.socket()
        sock.connect((self.host, self.port))
        return True
    except (socket.error, socket.timeout):
        return False

And after that, for a successful head at the address passed:

.. code-block:: python

    try:
        conn = HTTPConnection(self.url.hostname, self.url.port)

        conn.request('HEAD', self.url.path)
        response = conn.getresponse()

        if response.status is OK:
            conn.close()
            return True

    except (HTTPException, socket.timeout, socket.error):
        return False

And the code execution hanged just at the `conn.getresponse()` *I guess*. Unfortunately, when I tried to debug the code, it just worked, so I assume, debugging it, just turns off any optimisation PyPy is doing.

Few days later, a colleague of mine, **Paweł Wilczyński**, introduced checks before starting process, if ports are not already taken. It also reduced waits after starting to only check the HTTPConnection - and surprisingly tests started to pass.

At that time I still haven't got the slightest idea why pypy tests started to pass, and haven't before. So I started to play with the code instead of merging, and now, I think I know what happened.

Fault was ours, of course, and it was open socket, that have been left after the first check. Python must have been closing it, when it garbage collecting it, but PyPy's garbage collecting seems to be different - and left that socket open. Or PyPy just simply does not close the socket by itself, leaving it leaked.

Anyway, the solution was to fix first example by manually closing the socket in the end.

.. code-block:: python

    finally:
        socket.close()
