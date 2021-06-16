.. title: Creating a timestamp in python - difference between calendar.timegm and time.mktime
.. slug: creating-a-timestamp-in-python-difference-between-calendartimegm-and-timemktime
.. date: 2015-11-25 20:18:16 UTC+01:00
.. tags: time,python,calendar,performance
.. category: 
.. link: 
.. description: 
.. type: text

If think most of python programmers realise that there are two ways of getting timestamp with only the
help of stdlib libraries. It's `time.mktime <https://docs.python.org/3.5/library/time.html#time.mktime>`_
and weirdly placed `calendar.timegm <https://docs.python.org/3.5/library/calendar.html#calendar.timegm>`_.

There are two things people are probably not aware. First one can be attributed due to the fact that
their docs are not being read properly, or more often skipped is that **time.mktime** function treats
timetuple as if it were representing date and time in machine local time. This means even if you
extract timetuple from your datetime object using
`utctimetuple <https://docs.python.org/3.5/library/datetime.html#datetime.datetime.utctimetuple>`_ method
resulting timestamp will still be a given date in your system local time zone. Might not be a problem
at all on production, but will be a much bigger issue on your machine, when you pull some data to analyse.
**calendar.timegm** on the other hand, treats all input data as if it were passed in utc.

Speaking of which, none of those two functions accepts a parameter that would tell which timezone the
timetuple is in. The only difference is that **time.mktime** returns a float and **calendar.timegm**
returns an integer.

Second things - timegm function is faster than mktime! See the short benchmarks below:

.. TEASER_END

Results on python 3.5:

.. code-block:: python

    In [21]: %timeit time.mktime(timetuple)
    The slowest run took 32.44 times longer than the fastest. This could mean that an intermediate result is being cached
    1000000 loops, best of 3: 938 ns per loop

    In [22]: %timeit calendar.timegm(timetuple)
    The slowest run took 20.75 times longer than the fastest. This could mean that an intermediate result is being cached
    1000000 loops, best of 3: 817 ns per loop

And even faster on python 2.7:

.. code-block:: python

    In [21]: %timeit time.mktime(timetuple)
    The slowest run took 35.25 times longer than the fastest. This could mean that an intermediate result is being cached
    1000000 loops, best of 3: 906 ns per loop

    In [22]: %timeit calendar.timegm(timetuple)
    The slowest run took 24.31 times longer than the fastest. This could mean that an intermediate result is being cached
    1000000 loops, best of 3: 579 ns per loop

There seems to be some performance regression for timegm on python 3, but it's still a bit faster than mktime.