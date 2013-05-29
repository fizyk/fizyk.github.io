.. title: tzf.pyramid_yml 0.2
.. slug: tzfpyramid_yml-02
.. date: 2013/05/29 20:06:41
.. tags: python,pyramid,yaml
.. link:
.. description: tzf.pyramid_yml 0.2 - print your config, and provide defaults in package

tzf.pyramid_yml plugin is package, that provides Your pyramid application with inherited yaml based configuration system, and I've just released 0.2 version.

You can define several environments, like production, developing, have some sensible defaults in eg. config.yml file, and have it extend based on the environment config file (eg. config.dev.yml).

.. TEASER_END

Since 0.2, you can also add some defaults through your own pyramid plugin package. Simply use `tzf.pyramid_yml.config_defaults <https://tzfpyramid_yml.readthedocs.org/en/v0.2.0/api.html#tzf.pyramid_yml.config_defaults>`_ method. It's also beeing added to configuration object, once the tzf.pyramid_yml is included into application by *config.include()*.

Package also provides **pconfig** command line script, that allows inspect generated configuration.

* `Documentation <https://tzfpyramid_yml.readthedocs.org/en/v0.2.0/index.html>`_
* `PyPI <https://pypi.python.org/pypi/tzf.pyramid_yml/0.2.0>`_
* `GitHub <https://github.com/fizyk/pyramid_yml>`_
