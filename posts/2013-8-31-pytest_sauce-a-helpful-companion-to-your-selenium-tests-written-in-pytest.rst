.. title: pytest_sauce, a helpful companion to your selenium tests written in pytest
.. slug: pytest_sauce-a-helpful-companion-to-your-selenium-tests-written-in-pytest
.. tags: python,pytest,selenium,saucelabs
.. date: 2013/08/31 19:38:41
.. link:
.. description:

Last week, our team at `Clearcode <http://clearcode.cc/>`_ has released package to PyPI, that takes most of the tedious tasks when writing and running selenium tests of Ones shoulder. It main tasks is to take prepared configuration file, which tells paytest_sauce what tests and what browser should the tests be run in, and then run them. But that's not all.

.. TEASER_END

If it detects a chrome browser in test browser suite, it acquires a chromedriver, and then uses it to actually run your tests. So you no longer need to worry about getting it yourself. And since pytest_mozwegqa starts selenium server for you, all you need to worry about, are tests.

**pytest_sauce** also provides methods to download and run Saucalabs-Connect, to run tests remotely on Saucelabs in such exotic environments like Windows ;)

Links:

- `pytest_sauce at pypi <https://pypi.python.org/pypi/pytest_sauce>`_
- `pytest_sauce at Read The Docs <https://pytest_sauce.readthedocs.org/en/latest/>`_
- `pytest_sauce at GitHub <https://github.com/clearcode/pytest_sauce>`_

I must say, I enjoy working at company, that cares about sharing with OpenSource community.
