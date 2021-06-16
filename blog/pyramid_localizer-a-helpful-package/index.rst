.. tags: pyramid,python,i18n
.. date: 2013/06/17 19:50:06
.. title: pyramid_localize, a helpful package
.. slug: pyramid_localizer-a-helpful-package
.. link:
.. description: pyramid_localize

Localization, and internationalization of websites isn't easy, and neither it's easy with pyramid, although there's some `nice documentation <http://docs.pylonsproject.org/projects/pyramid/en/1.4-branch/narr/i18n.html>`_. So I prepared a package, that'll help setting most of the needed things to translate application written in pyramid framework.

.. TEASER_END

Package basically works three way, firstly, it adds subscribers, which in turn adds translation methods, the widely used underscore  - **"_"**, to request object, and to renderer. It works as described in pyramid documentation. Thanks to the underscore method, babel extractors can work out their magic, and rip all text that need to be translated from your code. That's it, no configuration needed.

Second thing, is, that this package can also configure your application, to do this, you need to follow this part of `pyramid_localize's documentation <https://pyramid_localize.readthedocs.org/en/latest/basic.html#configuration>`_, Please, forgive me, that I made use of pyramid_yml, rather than .ini configuration. I find it better suited to provide default configuration values.

Third option is rather intended for package developers, which could allow to develop translatable packages, with translation files, but without the need to actually use them. If you do not install babel, pyramid_localize will only install fake translation methods as underscore methods - **"_"**, which will do almost everything the standard method does, but without translating.

package can be found on `pypi already <https://pypi.python.org/pypi/pyramid_localize/0.0.1>`_ and the code on `github <https://github.com/fizyk/pyramid_localize>`_.
