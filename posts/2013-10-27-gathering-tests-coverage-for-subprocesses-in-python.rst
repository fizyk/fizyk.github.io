.. title: Gathering tests coverage for subprocesses in python
.. slug: gathering-tests-coverage-for-subprocesses-in-python
.. link:
.. tags: python,testing,coverage,pytest
.. date: 2013/10/27 20:22:05
.. description:

Recently at work I've stumbled across quite a problem, how do You check your code coverage, especially in integration tests, when portions of your code are running as subprocesses?

tl;dr: Be gentle.

.. TEASER_END

The answer wasn't obvious, but got first hint, in Ned Batchelder's, creator of coverage.py, `Running code at Python startup <http://nedbatchelder.com/blog/201001/running_code_at_python_startup.html>`_ blog post. Took me a while, since it was my first encounter with both ways **sitepackages.py** and **.pth**. Tried both of them, and got nothing, except for my Powerline Shell installation picking up code from the **sitepackages.py** file on each command entered into bash.

Well, just my luck. Since the solution written by Ned, utilizes Environmental variable, I tried to make sure subprocesses got the same variables from master process, and even checked what do they got. Everything seemed okay at this end, especially that we already used some environmental variable for settings, and test settings were picked up by subprocess.

Since we use `pytest <https://pypi.python.org/pypi/pytest>`_ testing suite for testing and `pytest-cov <https://pypi.python.org/pypi/pytest-cov>`_ plugin for gathering code coverage, I looked deeper at the plugins readme. Well... it says that it has code coverage for subprocess already built-in. Quick look at source of pytest-cov and cov-core made me realize, that I needlessly tried to use basic coverage.py functionality, as cov-core package already utilises the **.pth** way, although customized.

We use `summon_process <https://pypi.python.org/pypi/summon_process>`_ package to start subprocesses within pytest fixtures, which in turn, uses subprocess.Popen inside, so I took a look at the plugin, and tried to start subprocesses in it's own shell.

.. code-block:: python

    subprocess.Popen(command, shell=True)

I was suprised to see it working, BUT... some tests failed and at the end I got a nasty database lock, which made me forcefully end test session. Damn. Trying to figure out how to get rid of the lock took me nowhere. It ceratinly was the foult within the other plugin `pytet-dbfixtures <https://pypi.python.org/pypi/pytest-dbfixtures>`_ as me and my friend in the team initially thought. Database wasn't the problem either, so what was? Well we haven't been waiting for terminating of the process. But starting subprocess in it's own shell, certainly did help.

Quick modification of the summon_process locally and installation of thismodified package and... nothing. Same problem. I looked up at the process list, and saw that we have as many subprocesses, as there was tests requireing their fixtures. What?

As it turns out, when you try to kill subprocess started with shell=True, you kill the shell, subprocess doesn't get signal. Quick modification again, creating process group and sending signal to the process group as described in this `stackoverflow question <http://stackoverflow.com/questions/4789837/how-to-terminate-a-python-subprocess-launched-with-shell-true>`_. Quick modification and the code should change from:

.. code-block:: python

    def start(self):
        if self._process is None:
            self._process = subprocess.Popen(self._args,
                                             shell=self._shell,
                                             stdin=subprocess.PIPE,
                                             stdout=subprocess.PIPE)

    def stop(self):
        if self._process is not None:
            self._process.terminate()
            self._process = None

to:

.. code-block:: python

    def start(self):
        if self._process is None:
            self._process = subprocess.Popen(self._args,
                                             shell=self._shell,
                                             stdin=subprocess.PIPE,
                                             stdout=subprocess.PIPE,
                                             preexec_fn=os.setsid)

    def stop(self):
        if self._process is not None:
            os.killpg(self._process, signal.SIGTERM)
            self._process.wait()
            self._process = None

Should work, right? And it did. I got rid from faulty test runs, got rid from databse lock, and... got rid of subprocess coverage! What?!

At this moment, I had to take a break from the problem, but let me tell you if you can't solve a problem, take a break.

Got back to it few days later. Totally resigned started with reading all pytest-cov issues. Those closed ones And found issue about `coverage not collected for multiprocesses <https://bitbucket.org/memedough/pytest-cov/issue/6/coverage-not-collected-for>`_. Quite related. What does it say? That the coverage writes it data at the END of the process run, so starting process in reality first starts your coverage, then process. After the process ends, coverage writes it's data, which in turns gets picked up by coverage in master process, when it ends, and lands combined in the main coverage report.

So... how do we end the subprocess? We used terminate(). How does it ends the process? let check the `system signals man pages <http://man7.org/linux/man-pages/man7/signal.7.html>`_. Damn... it terminates process in place, so the coverage doesn't have the chance to write it's subreports!

I've modified the original stop method from summon_process package into this:

.. code-block:: python

    def stop(self):
        if self._process is not None:
            self._process.send_signal(signal.SIGINT)
            self._process.wait()
            self._process = None

And it worked! We didn't even had to start them with their own shell (starting subprocess with shells allowed for some of them to end correctly when killing main test thread).

So, the solution to *how gather coverage for subprocess* question is to **terminate them gently**. Well... `Tenacious D is right <http://vimeo.com/44725028>`_ again ;)

PS. Solving this problem resulted in `pull request for summon_process package <https://github.com/mlen/summon_process/pull/3/files>`_
