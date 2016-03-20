.. title: Running python tests on Travis's OSX workers
.. slug: running-python-tests-on-traviss-osx-workers
.. date: 2016-03-20 21:44:55 UTC+01:00
.. tags: python,osx,travis,tests
.. category: 
.. link: 
.. description: 
.. type: text

I, and my colleages are running tests mostly on linux, since our packages usually are clean python implementation.
However, for `mirakuru <https://pypi.python.org/pypi/mirakuru/>`_, which we use to govern processes in tests,
and by extension `pytest-dbfixtures <https://pypi.python.org/pypi/pytest-dbfixtures/>`_,
which has predefined process fixtures for pytest, we wanted to run tests also on osx. Travis.ci for
a long time had option to configure osx workers and linux, however python builds on osx are kind of broken by default.

Travis.ci has a long standing `bug report <https://github.com/travis-ci/travis-ci/issues/2312>`_ for this issue,
which will get 2 years old in this May. Apparently, just setting python as a language and osx among
the system to test on won't work for apple's operating system.

.. TEASER_END

Looking at the build log:

.. code-block::

    Build language: python
    Build group: stable
    Build dist: precise
    2.7 is not installed; attempting download
    /Users/travis/build.sh: line 235: lsb_release: command not found
    /Users/travis/build.sh: line 235: lsb_release: command not found
    tar: Unrecognized archive format
    tar: Error exit delayed from previous errors.
    sed: /etc/profile.d/pyenv.sh: No such file or directory
    tee: /etc/profile.d/pyenv.sh: No such file or directory
    git.checkout
    3.00s$ git clone --depth=50 --branch=master https://github.com/ClearcodeHQ/mirakuru.git ClearcodeHQ/mirakuru
    Cloning into 'ClearcodeHQ/mirakuru'...
    remote: Counting objects: 441, done.
    remote: Compressing objects: 100% (217/217), done.
    Receiving objremote: Total 441 (delta 272), reused 374 (delta 214), pack-reused 0
    Receiving objects: 100% (441/441), 110.51 KiB | 0 bytes/s, done.
    Resolving deltas: 100% (272/272), done.
    Checking connectivity... done.
    $ cd ClearcodeHQ/mirakuru
    $ git checkout -qf e30530ac1419cdfb0ff047651c54e5ed9e918024
    0.00s$ source ~/virtualenv/python2.7/bin/activate
    /Users/travis/build.sh: line 45: /Users/travis/virtualenv/python2.7/bin/activate: No such file or directory
    The command "source ~/virtualenv/python2.7/bin/activate" failed and exited with 1 during .

It seems that the travis tries to work as if it was an ubuntu based worker, which fails the whole build in just few seconds.

Luckily, in said bug report,
`a githubber Kodie Goodwin, shared his workaround for running tests within osx environment <https://github.com/travis-ci/travis-ci/issues/2312#issuecomment-195620855>`_.
It's basicaly requires building own python environment before proceeding to installation, and running the build as generic:

.. code-block:: yaml

    matrix:
        include:
            - os: osx
              language: generic
    # Perform the manual steps on osx to install python3 and activate venv
    before_install:
        - if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then brew update          ; fi
        - if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then brew install python3; fi
        - if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then virtualenv venv -p python3; fi
        - if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then source venv/bin/activate; fi

Same fragment is used in mirakuru. We're running only one build on osx now, since well...
the only difference should be in the underlying system, and the all supported python versions are already tested on linux.

Speaking of which, we have four tests failing on osx, but at least the builds are running, and now we can try to figure out what's wrong.
