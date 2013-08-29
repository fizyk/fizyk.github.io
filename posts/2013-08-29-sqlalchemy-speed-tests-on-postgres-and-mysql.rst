.. title: SQLAlchemy speed tests on postgres and mysql
.. slug: sqlalchemy-speed-tests-on-postgres-and-mysql
.. tags: mysql,postgresql,sqlalchemy,python
.. date: 2013/08/29 20:27:50
.. link:
.. description: Another SQLAlchemy speed tests. This time with postgresql.

10 months ago, I run sqlalchemy tests against mysql server on different mysql dialects. This time, I did the same, but for both postgres and mysql dialects.

.. TEASER_END

To run this tests I've chosen 6 dialects. 3 for postgres: **psycopg2**, **pypostgresql**, **pg8000** and 3 for mysql: **mysqldb** *(mysql-python)*, **oursql** and **mysqlconnector** *(mysql-connector-python)*. Out of these three, py-postgresql failed to install, as I run tests on python 2.7, and this connector requires at least python 3.1, and oursql failed during tests on Insert with rollback test on 100 objects.

The five tests were (same as on recent tests):

- Insert with rollback
- Insert with commit
- Select
- Delete with rollback
- Delete with commit

Test tools used here are (mostly upgraded):

- python (CPython) 2.7.4 (on Ubuntu 13.04)
- mysql 5.1.61 (hosted on megiteam.pl servers)
- postgresql 9.2.4 (hosted on megiteam.pl servers)
- sqlalchemy 0.8.2
- oursql 0.9.3.1
- mysql-connector-python 1.0.12
- mysqldb 1.2.4
- psycopg2 2.5.1
- pg8000 1.08

As previously, results favour MySQLdb, but this time, it goes head to head with psycopg2. There isn't much difference between these two (except when deleting) and giving, that postgresql gained recently more features, and few more are getting brewed, I think I found my new database engine of choice. But pg8000 is something that I'd avoid.

Test results
~~~~~~~~~~~~

+-------------------+-----------+------------+-------------+
|                   | s/run 1   | s/run 10   | s/run 100   |
+===================+===========+============+=============+
| psycopg2          | 0.077     | 0.316      | 2.884       |
+-------------------+-----------+------------+-------------+
| pg8000            | 0.325     | 1.432      | 12.360      |
+-------------------+-----------+------------+-------------+
| MySQLdb           | 0.109     | 0.316      | 2.795       |
+-------------------+-----------+------------+-------------+
| Connector         | 0.093     | 0.542      | 5.737       |
+-------------------+-----------+------------+-------------+
| Oursql            | 0.115     | 0.545      | ERROR       |
+-------------------+-----------+------------+-------------+

Table:  Insert with rollback

psycopg2 performance is comparable with MySQLdb. pg8000 is definitely something I will not use.

+-------------------+-----------+------------+-------------+
|                   | s/run 1   | s/run 10   | s/run 100   |
+===================+===========+============+=============+
| psycopg2          | 0.085     | 0.325      | 3.141       |
+-------------------+-----------+------------+-------------+
| pg8000            | 0.497     | 1.653      | 12.278      |
+-------------------+-----------+------------+-------------+
| MySQLdb           | 0.067     | 0.327      | 3.055       |
+-------------------+-----------+------------+-------------+
| Connector         | 0.105     | 0.587      | 5.283       |
+-------------------+-----------+------------+-------------+

Table:  Insert with commit

MySQLdb is the fastest connector when inserting and committing objects. But psycopg2 is close behind.

+-------------------+-----------+------------+-------------+
|                   | s/run 1   | s/run 10   | s/run 100   |
+===================+===========+============+=============+
| psycopg2          | 0.028     | 0.062      | 0.318       |
+-------------------+-----------+------------+-------------+
| pg8000            | 0.135     | 0.147      | 0.438       |
+-------------------+-----------+------------+-------------+
| MySQLdb           | 0.052     | 0.066      | 0.336       |
+-------------------+-----------+------------+-------------+
| Connector         | 0.073     | 0.095      | 0.314       |
+-------------------+-----------+------------+-------------+

Table:  Select

For simple select psycopg2 performed best out of all. MySQLdb closes to psycopg2 on selecting more objects, and Connector is close by.

+-------------------+-----------+------------+-------------+
|                   | s/run 1   | s/run 10   | s/run 100   |
+===================+===========+============+=============+
| psycopg2          | 0.048     | 0.051      | 0.057       |
+-------------------+-----------+------------+-------------+
| pg8000            | 0.224     | 0.235      | 0.236       |
+-------------------+-----------+------------+-------------+
| MySQLdb           | 0.084     | 0.071      | 0.257       |
+-------------------+-----------+------------+-------------+
| Connector         | 0.112     | 0.127      | 0.370       |
+-------------------+-----------+------------+-------------+

Table:  Delete with rollback

When it comes to reverting delete operation, postgresql should be your choice. No matter how many object, it still performed almost the same amount of time. Andy psycopg2 shines amongst all other connectors.

+-------------------+-----------+------------+-------------+
|                   | s/run 1   | s/run 10   | s/run 100   |
+===================+===========+============+=============+
| psycopg2          | 0.104     | 0.116      | 0.136       |
+-------------------+-----------+------------+-------------+
| pg8000            | 0.286     | 0.241      | 0.386       |
+-------------------+-----------+------------+-------------+
| MySQLdb           | 0.069     | 0.100      | 0.230       |
+-------------------+-----------+------------+-------------+
| Connector         | 0.092     | 0.116      | 0.102       |
+-------------------+-----------+------------+-------------+

Table:  Delete with commit

When committing delete operations, MySQLdb is best for single objects. But still regresses a lot, when the number of objects increases. As if there was no difference between rollback and commit. And there's only place, where Connector gets ahead of MySQLdb. postgres connectors are almost as steady as with roll-back, although committing seems to be taking twice that time as rollback


