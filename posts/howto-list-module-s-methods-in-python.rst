.. title: Howto list module's methods in python
.. slug: howto-list-module-s-methods-in-python
.. date: 2012/08/17 20:08:09
.. tags: python, howto, list
.. link:
.. description: I'm testing efficiency of three mysql connector libraries: mysql-connector, MySQLdb and oursql, within sqlalchemy. Took me a while to prepare basis, but after that, I began to wonder, how to make more methods, and run them, without worrying about their inclusion into testing process?

I'm testing efficiency of three mysql connector libraries:
mysql-connector, MySQLdb and oursql, within sqlalchemy. Took me a while
to prepare basis, but after that, I began to wonder, how to make more
methods, and run them, without worrying about their inclusion into
testing process?

After searching a while, I've found several solution, but the best one
employed **dir**:

::

    import types
    import module

    alchemy_tests = [module.__dict__.get(test) for test in dir(module)
                         if isinstance(module.__dict__.get(test), types.FunctionType)
                            and test.startswith('sqltest_')]

There are two parts, first one is iterating over module's elements:

::

    module.__dict__.get(test) for test in dir(module)

Second one is condition, telling when do we want to include module's
element in a list:

::

    if isinstance(module.__dict__.get(test), types.FunctionType)
    and test.startswith('sqltest_')

Now remember, that list returned by **dir** contains only names, hence
the **module.\_\_dict\_\_.get**, which returns module's elements.

And here's unfolded version:

::

    import types
    import module

    alchemy_tests = []
        for test in dir(module):
            if isinstance(module.__dict__.get(test), types.FunctionType) \
                and test.startswith('sqltest_'):
                alchemy_tests.append(module.__dict__.get(test))

