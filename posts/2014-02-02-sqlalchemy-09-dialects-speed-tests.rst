.. title: SQLAlchemy 0.9 dialects speed tests
.. slug: sqlalchemy-09-dialects-speed-tests
.. date: 2014/02/02 22:14:23
.. tags: python,sqlalchemy,mysql,postgresql
.. link:
.. description:
.. type: text

This fourth `SQLAlchemy's <http://www.sqlalchemy.org/>`_ dialects speed tests aims to test this ORM's newest version, 0.9.x, which is available for about a month already. This version, amongst other improvements, contains C extension for python3.

.. TEASER_END

There are six dialects tested like previously: 3 for postgres: **psycopg2**, **pypostgresql**, **pg8000** and 3 for mysql: **mysqldb** *(mysql-python)*, **oursql** and **mysqlconnector** *(mysql-connector-python)*.


**My basic setup:**

* System: **Ubuntu 13.10 64bit**
* Python: **Python 2.7.5+**/**Python 3.3.2+**
* SQLAlchemy: **0.9.1**

**Connectors versions used were:**

* oursql: **0.9.3.1**
* mysql-connector-python: **1.1.4** (*new*)
* mysqldb: **1.2.5** (*new*)
* psycopg2: **2.5.2** (*new*)
* pg8000 **1.9.4** (*new*)
* py-postgresql: **1.1.0**

Most major packages had seen patch updates since the last test, with mysql-connector-python seeing a minor update.

**Tests run, were the five tests as previously:**

* Insert with rollback
* Insert with commit
* Select
* Delete with rollback
* Delete with commit

.. note:

I had to extend **run.sh** of my test suite script to facilitate the fact, that the mysql-connector-python is not hosted on pypi.

Test results
~~~~~~~~~~~~

+--------------------+-----------+------------+-------------+
|                    | s/run 1   | s/run 10   | s/run 100   |
+====================+===========+============+=============+
| psycopg2           | 0.049     | 0.199      | 1.746       |
+--------------------+-----------+------------+-------------+
| psycopg2 (py3)     | 0.048     | 0.202      | 1.762       |
+--------------------+-----------+------------+-------------+
| pg8000             | 0.194     | 0.746      | 6.450       |
+--------------------+-----------+------------+-------------+
| pg8000 (py3)       | 0.196     | 0.760      | 6.397       |
+--------------------+-----------+------------+-------------+
| py-postgresql (py3)| 0.127     | 0.532      | 4.827       |
+--------------------+-----------+------------+-------------+
| MySQLdb            | 0.069     | 0.368      | 2.850       |
+--------------------+-----------+------------+-------------+
| Connector          | 0.066     | 0.438      | 3.489       |
+--------------------+-----------+------------+-------------+
| Connector (py3)    | 0.070     | 0.449      | 3.846       |
+--------------------+-----------+------------+-------------+
| Oursql             | 0.102     | 0.422      | 3.539       |
+--------------------+-----------+------------+-------------+

Table:  Insert with rollback

Like before, no real difference between python2 and python3 able connectors. With psycopg2 still the fastest of all (even mysql) and pg800 being about 50% slower than py-postgresql.
MySQLdb as usual leads within MySQL connectors, with Mysql-connector-python close by.


+--------------------+-----------+------------+-------------+
|                    | s/run 1   | s/run 10   | s/run 100   |
+====================+===========+============+=============+
| psycopg2           | 0.063     | 0.226      | 2.187       |
+--------------------+-----------+------------+-------------+
| psycopg2 (py3)     | 0.113     | 0.392      | 1.979       |
+--------------------+-----------+------------+-------------+
| pg8000             | 0.227     | 1.119      | 6.682       |
+--------------------+-----------+------------+-------------+
| pg8000 (py3)       | 0.331     | 0.815      | 6.632       |
+--------------------+-----------+------------+-------------+
| py-postgresql (py3)| 0.151     | 0.684      | 5.079       |
+--------------------+-----------+------------+-------------+
| MySQLdb            | 0.055     | 0.325      | 2.521       |
+--------------------+-----------+------------+-------------+
| Connector          | 0.061     | 0.353      | 3.452       |
+--------------------+-----------+------------+-------------+
| Connector (py3)    | 0.068     | 0.420      | 3.700       |
+--------------------+-----------+------------+-------------+
| Oursql             | 0.083     | 0.394      | 3.741       |
+--------------------+-----------+------------+-------------+

Table:  Insert with commit

Not much different for insert with commit, although this operation is taking longer for all connectors. Oursql passed all tests this time.

+--------------------+-----------+------------+-------------+
|                    | s/run 1   | s/run 10   | s/run 100   |
+====================+===========+============+=============+
| psycopg2           | 0.019     | 0.029      | 0.118       |
+--------------------+-----------+------------+-------------+
| psycopg2 (py3)     | 0.018     | 0.027      | 0.116       |
+--------------------+-----------+------------+-------------+
| pg8000             | 0.079     | 0.109      | 0.198       |
+--------------------+-----------+------------+-------------+
| pg8000 (py3)       | 0.078     | 0.088      | 0.198       |
+--------------------+-----------+------------+-------------+
| py-postgresql (py3)| 0.046     | 0.059      | 0.139       |
+--------------------+-----------+------------+-------------+
| MySQLdb            | 0.026     | 0.035      | 0.119       |
+--------------------+-----------+------------+-------------+
| Connector          | 0.036     | 0.043      | 0.133       |
+--------------------+-----------+------------+-------------+
| Connector (py3)    | 0.036     | 0.045      | 0.140       |
+--------------------+-----------+------------+-------------+
| Oursql             | ERROR     | ERROR      | ERROR       |
+--------------------+-----------+------------+-------------+

Table:  Select test

Not much change since last time I presented results for this test, except  mysql-connector-python gets on-par between different python versions.

+--------------------+-----------+------------+-------------+
|                    | s/run 1   | s/run 10   | s/run 100   |
+====================+===========+============+=============+
| psycopg2           | 0.033     | 0.033      | 0.043       |
+--------------------+-----------+------------+-------------+
| psycopg2 (py3)     | 0.032     | 0.032      | 0.040       |
+--------------------+-----------+------------+-------------+
| pg8000             | 0.163     | 0.164      | 0.180       |
+--------------------+-----------+------------+-------------+
| pg8000 (py3)       | 0.163     | 0.180      | 0.171       |
+--------------------+-----------+------------+-------------+
| py-postgresql (py3)| 0.118     | 0.121      | 0.145       |
+--------------------+-----------+------------+-------------+
| MySQLdb            | 0.045     | 0.064      | 0.144       |
+--------------------+-----------+------------+-------------+
| Connector          | 0.067     | 0.095      | 0.306       |
+--------------------+-----------+------------+-------------+
| Connector (py3)    | 0.074     | 0.064      | 0.086       |
+--------------------+-----------+------------+-------------+
| Oursql             | ERROR     | ERROR      | ERROR       |
+--------------------+-----------+------------+-------------+

Table:  Delete with rollback

Again, quite an improvement for mysql-connector-python on python3 here. Other differences could be attributed to network.

+--------------------+-----------+------------+-------------+
|                    | s/run 1   | s/run 10   | s/run 100   |
+====================+===========+============+=============+
| psycopg2           | 0.081     | 0.081      | 0.106       |
+--------------------+-----------+------------+-------------+
| psycopg2 (py3)     | 0.046     | 0.049      | 0.058       |
+--------------------+-----------+------------+-------------+
| pg8000             | 0.480     | 0.386      | 0.388       |
+--------------------+-----------+------------+-------------+
| pg8000 (py3)       | 0.280     | 0.300      | 0.303       |
+--------------------+-----------+------------+-------------+
| py-postgresql (py3)| 0.152     | 0.156      | 0.229       |
+--------------------+-----------+------------+-------------+
| MySQLdb            | 0.047     | 0.061      | 0.193       |
+--------------------+-----------+------------+-------------+
| Connector          | 0.074     | 0.062      | 0.120       |
+--------------------+-----------+------------+-------------+
| Connector (py3)    | 0.066     | 0.063      | 0.232       |
+--------------------+-----------+------------+-------------+
| Oursql             | ERROR     | ERROR      | ERROR       |
+--------------------+-----------+------------+-------------+

Table:  Delete with commit

When committing a delete operation, psycopg2 seems to perform better on python3 than python2.


Summarizing
~~~~~~~~~~~

There are some overall improvements when it comes to mysql-connector-python performance, but still, MySQLdb takes the lead for MySQL connectors. Still postgres' psycopg2 seems to perform better in most cases, and works on python3 as well. Oursql made it one step further without any work on the package.

Surprisingly, there isn't any speedup I could attribute to SQLAlchemy's C extensions being enabled on python3, although, I was hoping for one. Mysql-connector-python could be rather attributed to some mjor work done to it.


Tests code
~~~~~~~~~~

Test code can be checked here `github.com/fizyk/sqlalchemy-tests <https://github.com/fizyk/sqlalchemy-tests>`_. Requirement for it is to have virtualenvwrapper installed, and script itself should create clean envirtonments and install required dependeincies for tets.

Got some ideas on moving this code to py.test based tests with some logger fixture to produce pre-rendered reports.
