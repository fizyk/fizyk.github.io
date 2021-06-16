.. title: Deploying python packages with travis-ci
.. slug: deploying-python-packages-with-travis-ci
.. date: 2014/05/04 19:21:09
.. tags: pypi,travis,python
.. link:
.. description:
.. type: text

Deploying applications is tedious, so is deployin packages, no matter the package repository.
For example after applying changes to codebase, the code needs to be tagged,
as to not loose the point of release from sight, after that the packages needs
to be built and uploaded. It's far too many commands that need to be done.
One might develop some deployment scripts. Sure, but what, if we could use something else to
deploy packages for us?

.. TEASER_END

For a some time I've used `bumpversion <https://pypi.python.org/pypi/bumpversion>`_
to keep track of new releases in code by automatically  tagging code in repository.
Still have to push the code, preferably wait for tests to complete, and then
upload all those different packages to pypi.

Luckily, there's `travis-ci.org <http://travis-ci.org/>`_, with it's
`deployment ability <http://docs.travis-ci.com/user/deployment/pypi/>`_.
Unfortunately, it's somewhat broken, because if you want to release your code
in wheel packages, it of course install wheel package, that is required by
setuptools to package your code into a wheel, but it does so system-wide.
And deployment is taking place from within virtualenv, which results in:

.. warning::

    error: invalid command 'bdist_wheel' while deploying package to pypi

Well, to counter this, you need to add wheel installation yourself, like this:

.. code-block:: yaml

    install:
        # other installation steps
        # manually install wheel for deployment
        - "pip install wheel pylama --use-mirrors"


After these changes, my deployment process got down to bumping code version with
bumpversion and pushing tags and code to github.
