.. link:
.. tags: mysql,postgresql,sqlalchemy,python
.. date: 2013/12/22 14:11:33
.. title: Year's end SQLAlchemy speed tests on postgres and mysql
.. slug: years-end-sqlalchemy-speed-tests-on-postgres-and-mysql
.. description:

This third SQLAlchemy speed tests for various dialects is my third try, prompted by Tony Locke. Tony is a contributor to `pg8000 <https://pypi.python.org/pypi/pg8000>`_ postgresql connector, which just recently got a huge overhaul and got a new version, after almost three years. I was happy to comply, as his request got me reason to work a little bit on my testing script as well, and automate the whole process.

.. TEASER_END

This test, as previous, has been run on 6 dialects: 3 for postgres: **psycopg2**, **pypostgresql**, **pg8000** and 3 for mysql: **mysqldb** *(mysql-python)*, **oursql** and **mysqlconnector** *(mysql-connector-python)*. But this time, I've run all tests for all these connectors both on Python 2.7 and Python 3.3.

My basic setup almost hasn't changed since my last test in August.

* System: **Ubuntu 13.10 64bit**
* Python: **Python 2.7.5+**/**Python 3.3.2+**
* SQLAlchemy: **0.8.4**

Connectors versions used were:

* oursql: **0.9.3.1**
* mysql-connector-python: **1.0.12**
* mysqldb: **1.2.4**
* psycopg2: **2.5.1**
* pg8000 **1.9.2**
* py-postgresql: **1.1.0**

Tests run, were the five tests as previously:

* Insert with rollback
* Insert with commit
* Select
* Delete with rollback
* Delete with commit

All in all test suite has been run 9 times, py-postgresql requires at least python 3.1, and both MySQLdb and oursql wouldn't install on Python 3.3.

Test results
~~~~~~~~~~~~

+--------------------+-----------+------------+-------------+
|                    | s/run 1   | s/run 10   | s/run 100   |
+====================+===========+============+=============+
| psycopg2           | 0.046     | 0.226      | 1.742       |
+--------------------+-----------+------------+-------------+
| psycopg2 (py3)     | 0.054     | 0.222      | 1.742       |
+--------------------+-----------+------------+-------------+
| pg8000             | 0.203     | 0.776      | 6.457       |
+--------------------+-----------+------------+-------------+
| pg8000 (py3)       | 0.211     | 0.731      | 6.337       |
+--------------------+-----------+------------+-------------+
| py-postgresql (py3)| 0.111     | 0.541      | 4.858       |
+--------------------+-----------+------------+-------------+
| MySQLdb            | 0.052     | 0.246      | 2.413       |
+--------------------+-----------+------------+-------------+
| Connector          | 0.073     | 0.375      | 3.339       |
+--------------------+-----------+------------+-------------+
| Connector (py3)    | 0.161     | 1.448      | 4.931       |
+--------------------+-----------+------------+-------------+
| Oursql             | 0.080     | 0.437      | 3.810       |
+--------------------+-----------+------------+-------------+

Table:  Insert with rollback

Both psycopg2 and pg8000 performed almost the same under python 2.7 and python 3.3, though pg8000 is couple of times slower. py-postgresql placed itself in the middle between other postgresql connectors. Mysql's Connector has seen a big performance dropdown when switching python versions here. All in all, there's a substantial efficiency gain in every database connector, with the most significant gains for pg8000.


+--------------------+-----------+------------+-------------+
|                    | s/run 1   | s/run 10   | s/run 100   |
+====================+===========+============+=============+
| psycopg2           | 0.155     | 0.328      | 2.069       |
+--------------------+-----------+------------+-------------+
| psycopg2 (py3)     | 0.088     | 0.259      | 1.962       |
+--------------------+-----------+------------+-------------+
| pg8000             | 0.291     | 1.026      | 6.959       |
+--------------------+-----------+------------+-------------+
| pg8000 (py3)       | 0.235     | 0.977      | 6.510       |
+--------------------+-----------+------------+-------------+
| py-postgresql (py3)| 0.243     | 0.749      | 4.959       |
+--------------------+-----------+------------+-------------+
| MySQLdb            | 0.057     | 0.235      | 2.396       |
+--------------------+-----------+------------+-------------+
| Connector          | 0.061     | 0.358      | 3.312       |
+--------------------+-----------+------------+-------------+
| Connector (py3)    | 0.112     | 0.639      | 4.615       |
+--------------------+-----------+------------+-------------+
| Oursql             | 0.080     | 0.401      | ERROR       |
+--------------------+-----------+------------+-------------+

Table:  Insert with commit

psycopg2 performance had regressed when it comes to one object, but speed up otherwise for larger groups. pg8000 speed up significantly, although still py-postgresql has been faster here. MySQLdb seems to be fastest with small ammounts, and comparable to psycopg2, with 100 object's per run. Oursql errored here. (Whole test later than last time).

+--------------------+-----------+------------+-------------+
|                    | s/run 1   | s/run 10   | s/run 100   |
+====================+===========+============+=============+
| psycopg2           | 0.022     | 0.029      | 0.118       |
+--------------------+-----------+------------+-------------+
| psycopg2 (py3)     | 0.018     | 0.028      | 0.114       |
+--------------------+-----------+------------+-------------+
| pg8000             | 0.076     | 0.092      | 0.209       |
+--------------------+-----------+------------+-------------+
| pg8000 (py3)       | 0.077     | 0.088      | 0.208       |
+--------------------+-----------+------------+-------------+
| py-postgresql (py3)| 0.045     | 0.058      | 0.143       |
+--------------------+-----------+------------+-------------+
| MySQLdb            | 0.018     | 0.032      | 0.134       |
+--------------------+-----------+------------+-------------+
| Connector          | 0.035     | 0.044      | 0.147       |
+--------------------+-----------+------------+-------------+
| Connector (py3)    | 0.051     | 0.057      | 0.140       |
+--------------------+-----------+------------+-------------+
| Oursql             | ERROR     | ERROR      | ERROR       |
+--------------------+-----------+------------+-------------+

Table:  Select test

When it comes to python2, postgresql connectors seems to be faster here, with exception to pg8000. All connectors has made a significant progress here since last time I checked.

+--------------------+-----------+------------+-------------+
|                    | s/run 1   | s/run 10   | s/run 100   |
+====================+===========+============+=============+
| psycopg2           | 0.031     | 0.033      | 0.055       |
+--------------------+-----------+------------+-------------+
| psycopg2 (py3)     | 0.032     | 0.031      | 0.042       |
+--------------------+-----------+------------+-------------+
| pg8000             | 0.205     | 0.171      | 0.178       |
+--------------------+-----------+------------+-------------+
| pg8000 (py3)       | 0.162     | 0.170      | 0.171       |
+--------------------+-----------+------------+-------------+
| py-postgresql (py3)| 0.127     | 0.124      | 0.135       |
+--------------------+-----------+------------+-------------+
| MySQLdb            | 0.049     | 0.101      | 0.183       |
+--------------------+-----------+------------+-------------+
| Connector          | 0.070     | 0.106      | 0.147       |
+--------------------+-----------+------------+-------------+
| Connector (py3)    | 0.093     | 0.064      | 0.218       |
+--------------------+-----------+------------+-------------+
| Oursql             | ERROR     | ERROR      | ERROR       |
+--------------------+-----------+------------+-------------+

Table:  Delete with rollback

When it comes to changing your mind during deleting data from database, postgresql is your man.Deletion times do not differ much from one object to 100, and here, pg800 isn't much slower than mysql connectors.

+--------------------+-----------+------------+-------------+
|                    | s/run 1   | s/run 10   | s/run 100   |
+====================+===========+============+=============+
| psycopg2           | 0.046     | 0.052      | 0.079       |
+--------------------+-----------+------------+-------------+
| psycopg2 (py3)     | 0.081     | 0.095      | 0.056       |
+--------------------+-----------+------------+-------------+
| pg8000             | 0.254     | 0.268      | 0.342       |
+--------------------+-----------+------------+-------------+
| pg8000 (py3)       | 0.280     | 0.300      | 0.303       |
+--------------------+-----------+------------+-------------+
| py-postgresql (py3)| 0.202     | 0.208      | 0.201       |
+--------------------+-----------+------------+-------------+
| MySQLdb            | 0.047     | 0.050      | 0.177       |
+--------------------+-----------+------------+-------------+
| Connector          | 0.059     | 0.072      | 0.259       |
+--------------------+-----------+------------+-------------+
| Connector (py3)    | 0.079     | 0.083      | 0.287       |
+--------------------+-----------+------------+-------------+
| Oursql             | ERROR     | ERROR      | ERROR       |
+--------------------+-----------+------------+-------------+

Table:  Delete with commit

Also when committing delete operation, it doesn't make much difference for posgresql if it deltes one or more objects. But it makes all the difference for mysql.

Summarizing
~~~~~~~~~~~

If you want to be interoperable between python 2 and python 3, then posgresql should become your choice, it's connectors performs almost the same in python 2 and 3, which is kind of surprising, since on python3, sqlalchemy 0.8.x doesn't get c extensions for python 3.
The only mysql connector that works on python 3 regressed when running on python 3.

Also, it seems that all connectors made progress since last tests, when running on sqlalchemy 0.8.4, but the newest version of pg8000 speed doubled in most of the cases, which brings hope to it.

It'll be interesting to see how much sqlalchemy 0.9 will gain on python3, as it'll finally support C extensions on that platform.


Tests code
~~~~~~~~~~

Test code can be checked here `github.com/fizyk/sqlalchemy-tests <https://github.com/fizyk/sqlalchemy-tests>`_. Requirement for it is to have virtualenvwrapper installed, and script itself should create clean envirtonments and install required dependeincies for tets.

I'd like to automate it further some time, probably with the use of py.test and pytest-dbfixtures to setup databases along with tests.


