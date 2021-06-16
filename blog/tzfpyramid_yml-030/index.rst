.. link:
.. description:
.. tags: python,pyramid,yaml
.. date: 2013/12/15 23:13:05
.. title: tzf.pyramid_yml 0.3.0
.. slug: tzfpyramid_yml-030

I've just released new version of **tzf.pyramid_yml**. For toally new thing foir this package, I Licensed it under MIT License. Apart from that it introduces few enchancements in terms of defining config location.

.. TEASER_END

* First of all, you can read it from several files - thanks to it, sensitive data, like database access, email configs for production, can be kept separately from your project repo, and this still allows you to keep every other defaults within.
* Secondly, you can define location directly to file, which will read only from this file, and it's environment version.
* Lastly, pyramid_yml will only read files that exists.

This package has it's tests rewritten to pytest as well, thans to *Łukasz Zusel*, and pylama.ini config introduced to keep some coding standards.

As always, package can be found on pypi `tzf.pyramid_yml 0.3.0 <https://pypi.python.org/pypi/tzf.pyramid_yml/0.3.0>`_

