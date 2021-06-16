.. title: sqlAlchemy speed tests on mysql-connector-python, mysqldb and oursql drivers
.. slug: sqlalchemy-speed-tests-on-mysql-connector-python-mysqldb-and-oursql-drivers
.. date: 2012/10/18 23:10:15
.. tags: mysql, python, sqlalchemy
.. link:
.. description: Some time ago, I decided to check, how sqlalchemy will cope with different mysql drivers in terms of efficiency. At Red Sky, we used MySQLdb for all python projects, at least within our team. But MySQLdb requires mysql-client library, and does some compiling during installation.

Some time ago, I decided to check, how sqlalchemy will cope with
different mysql drivers in terms of efficiency. At Red Sky, we used
`MySQLdb <http://pypi.python.org/pypi/MySQL-python/1.2.4b5>`_ for all
python projects, at least within our team. But MySQLdb requires
mysql-client library, and does some compiling during installation.

.. TEASER_END

I was wondering how other drivers will perform, and then saw `Geert
Vanderkelen's <http://geert.vanderkelen.org/mysql-connector-python-1-0-5-beta/>`_
post about
`mysql-connector <http://pypi.python.org/pypi/mysql-connector-python>`_,
which he is apparently developing at Oracle, so I decided to write a
little test, and see how it will present itself compared to compiled
MySQLdb. I've chosen also `oursql <http://pypi.python.org/pypi/oursql>`_
as a third driver in this comparison.

Overall there were 5 different tests performed, each in three runs for
100 operations for 1, 10 and 100 objects per operation.

The five tests were:

-  Insert with rollback
-  Insert with commit
-  Select
-  Delete with rollback
-  Delete with commit

Test tools used here are:

-  python (CPython) 2.7.3 (on Ubuntu 12.04)
-  mysql 5.1.61 (hosted on megiteam.pl servers)
-  sqlalchemy 0.7.9
-  oursql 0.9.3.1
-  mysql-connector-python 1.0.6b2
-  mysqldb 1.2.3 and 1.2.4b5

Result were all in favour of **MySQLdb**, what was to be expected, since
it uses some C modules compiled against mysql-client library (you
actually need mysql-client-dev if you're installing it on virtualenv).
But let me present those results:

Test results
~~~~~~~~~~~~

+-------------------+-----------+------------+-------------+
|                   | s/run 1   | s/run 10   | s/run 100   |
+===================+===========+============+=============+
| MySQLdb 1.2.3     | 0.083     | 0.352      | 3.097       |
+-------------------+-----------+------------+-------------+
| MySQLdb 1.2.4b5   | 0.096     | 0.331      | 2.825       |
+-------------------+-----------+------------+-------------+
| Connector         | 0.107     | 0.621      | 4.956       |
+-------------------+-----------+------------+-------------+
| Oursql            | 0.131     | 0.651      | 5.790       |
+-------------------+-----------+------------+-------------+

Table:  Insert with rollback

As expected, mysqdb is performing much better, with older version being
better at one object operations and newer slightly better on multiobject
operations. Connector not much slower on one object operations, but
twice slower like oursql on multiobject operations

+-------------------+-----------+------------+-------------+
|                   | s/run 1   | s/run 10   | s/run 100   |
+===================+===========+============+=============+
| MySQLdb 1.2.3     | 0.082     | 0.368      | 3.402       |
+-------------------+-----------+------------+-------------+
| MySQLdb 1.2.4b5   | 0.074     | 0.374      | 3.128       |
+-------------------+-----------+------------+-------------+
| Connector         | 0.129     | 0.596      | 5.539       |
+-------------------+-----------+------------+-------------+
| Oursql            | 0.130     | 0.647      | 5.638       |
+-------------------+-----------+------------+-------------+

Table:  Insert with commit

With commiting inserts, Connector is only slightly better than oursql,
with mysqldb much faster in all cases.

+-------------------+-----------+------------+-------------+
|                   | s/run 1   | s/run 10   | s/run 100   |
+===================+===========+============+=============+
| MySQLdb 1.2.3     | 0.031     | 0.039      | 0.199       |
+-------------------+-----------+------------+-------------+
| MySQLdb 1.2.4b5   | 0.033     | 0.040      | 0.142       |
+-------------------+-----------+------------+-------------+
| Connector         | 0.056     | 0.067      | Error       |
+-------------------+-----------+------------+-------------+
| Oursql            | 0.078     | 0.109      | 0.235       |
+-------------------+-----------+------------+-------------+

Table:  Select

With simple select both mysqldb versions were much better, but connector
in the middle road between mysqldb and oursql. With surprise error on
SELECT 100 test... Every time I tried to run it, MySQL server would go
away "*sqlalchemy.exc.InterfaceError: (InterfaceError) 2013: Lost
connection to MySQL server during query u'SELECT(...)*\ " And that's
just this test.

+-------------------+-----------+------------+-------------+
|                   | s/run 1   | s/run 10   | s/run 100   |
+===================+===========+============+=============+
| MySQLdb 1.2.3     | 0.074     | 0.079      | 0.120       |
+-------------------+-----------+------------+-------------+
| MySQLdb 1.2.4b5   | 0.074     | 0.101      | 0.088       |
+-------------------+-----------+------------+-------------+
| Connector         | 0.103     | 0.103      | 0.120       |
+-------------------+-----------+------------+-------------+
| Oursql            | 0.103     | 0.146      | 0.278       |
+-------------------+-----------+------------+-------------+

Table:  Delete with rollback

Rollback delete finally brings connector close to mysqldb performance.
And oursql still performs worse, with except deleting one item, where it
has identical performance to connector. Strangely, if you're going to
probably delete (but possibly roll it back) lots of object, your choice
would be newer version od MySQLdb, but if you have less quantities,
older would save you some fractal of a seconds.

+-------------------+-----------+------------+-------------+
|                   | s/run 1   | s/run 10   | s/run 100   |
+===================+===========+============+=============+
| MySQLdb 1.2.3     | 0.078     | 0.078      | 0.117       |
+-------------------+-----------+------------+-------------+
| MySQLdb 1.2.4b5   | 0.072     | 0.071      | 0.097       |
+-------------------+-----------+------------+-------------+
| Connector         | 0.112     | 0.106      | 0.134       |
+-------------------+-----------+------------+-------------+
| Oursql            | 0.111     | 0.132      | 0.203       |
+-------------------+-----------+------------+-------------+

Table:  Delete with commit

Commiting makes connector performance worse, but it's still much better
than oursql. MySQLdb newer version is choice here.

I must admit, I was silently hoping that connector will perform better,
comparable to MySQLdb. It's still good, but delete opeartions are
usually less possible, than inserts, where MySQLdb fully shines. And
error found on select test is not helping either. Oursql... is what I
expected after first tries.

If you'd like to test by yourself, here's the code (yep, it's been
created almost two months ago):

.. code-block:: python

    # -*- coding: utf-8 -*
    '''
    Created on 12-08-2012

    @author: fizyk
    '''
    import sys
    import timeit
    import types

    from sqlalchemy.ext.declarative import declarative_base
    from sqlalchemy import Column
    from sqlalchemy import Integer
    from sqlalchemy import Unicode
    from sqlalchemy import UnicodeText
    from sqlalchemy import create_engine
    from sqlalchemy.orm import sessionmaker

    Base = declarative_base()

    # 238 characters length
    title = u'Here, the Object Relational Mapper is introduced and fully described. If you want to work with higher-level SQL which is constructed automatically for you, as well as automated persistence of Python objects, proceed first to the tutorial.{0}'
    #1912 characters length
    text = u'''
    The SQLAlchemy Object Relational Mapper presents a method of associating user-defined Python classes with database tables, and instances of those classes (objects) with rows in their corresponding tables. It includes a system that transparently synchronizes all changes in state between objects and their related rows, called a unit of work, as well as a system for expressing database queries in terms of the user defined classes and their defined relationships between each other.

    The ORM is in contrast to the SQLAlchemy Expression Language, upon which the ORM is constructed. Whereas the SQL Expression Language, introduced in SQL Expression Language Tutorial, presents a system of representing the primitive constructs of the relational database directly without opinion, the ORM presents a high level and abstracted pattern of usage, which itself is an example of applied usage of the Expression Language.

    While there is overlap among the usage patterns of the ORM and the Expression Language, the similarities are more superficial than they may at first appear. One approaches the structure and content of data from the perspective of a user-defined domain model which is transparently persisted and refreshed from its underlying storage model. The other approaches it from the perspective of literal schema and SQL expression representations which are explicitly composed into messages consumed individually by the database.

    A successful application may be constructed using the Object Relational Mapper exclusively. In advanced situations, an application constructed with the ORM may make occasional usage of the Expression Language directly in certain areas where specific database interactions are required.

    The following tutorial is in doctest format, meaning each >>> line represents something you can type at a Python command prompt, and the following text represents the expected return value.{0}
    '''


    class Test(Base):

        __tablename__ = 'test_table'

        id = Column(Integer, primary_key=True)
        title = Column(Unicode(255), nullable=False)
        text = Column(UnicodeText, nullable=False)


    dialect = str(sys.argv[1])
    engine = create_engine('{0}://my_8685a:testtest@fizyk.megiteam.pl:3307/my_8685'.format(dialect))

    Session = sessionmaker(bind=engine)
    session = Session()
    Base.metadata.create_all(engine)


    def _create_test_objects(counter):
        tests = []
        for i in xrange(counter):
            tests.append(Test(title=title.format(i),
                         text=text.format(i)))
        return tests


    def _read_ids(session, limit):
        ids = session.query(Test.id).offset(0).limit(limit).all()

        return [id[0] for id in ids]


    def sqltest_add_rollback(session, tests):
        'Insert rollback test'
        session.add_all(tests)
        session.flush()
        session.rollback()

    sqltest_add_rollback.__arg__ = 'list'


    def sqltest_add_commit(session, tests):
        'Insert commit test'
        session.add_all(tests)
        session.flush()
        session.commit()

    sqltest_add_commit.__arg__ = 'list'


    def sqltest_select(session, number):
        'Select test'
        elements = session.query(Test)[:number]

    sqltest_select.__arg__ = 'int'


    def sqltest_delete_rollback(session, ids):
        'Delete test rollback'
        session.query(Test).filter(Test.id.in_(ids)).delete(synchronize_session=False)
        session.rollback()

    sqltest_delete_rollback.__arg__ = 'del'


    def sqltest_delete_commit(session, ids):
        'Delete test commit'
        session.query(Test).filter(Test.id.in_(ids)).delete(synchronize_session=False)
        session.commit()

    sqltest_delete_commit.__arg__ = 'del'


    if __name__ == '__main__':
        test_repeat = int(sys.argv[2])
        counters = [1, 10, 100]

        alchemy_tests = [
            sqltest_add_rollback,
            sqltest_add_commit,
            sqltest_select,
            sqltest_delete_rollback,
            sqltest_delete_commit
        ]

        print '=' * 20
        print '{dialect} dialect test'.format(dialect=dialect)

        for alchemy_test in alchemy_tests:
            print '-' * 20
            print alchemy_test.__doc__

            for c in counters:
                print 'Objects: {0} ({1} tests)'.format(c, test_repeat)
                t_avg = 0
                t_max = 0
                t_min = 0
                for i in xrange(test_repeat):
                    if alchemy_test.__arg__ == 'list':
                        tests = _create_test_objects(c)
                    elif alchemy_test.__arg__ == 'del':
                        tests = _read_ids(session, c)
                    else:
                        tests = c

                    timer = timeit.Timer(lambda: alchemy_test(session, tests))
                    try:
                        current = timer.timeit(number=1)
                        if not t_min or t_min > current:
                            t_min = current
                        if t_max < current:
                            t_max = current
                        t_avg += current
                    except:
                        timer.print_exc()
                        raise

                print "{0:.3f} s/run. t_min: {1:.3f}, t_max: {2:.3f}, object_average: {3:.3f}".format((t_avg / test_repeat), t_min, t_max, (t_avg / (test_repeat * c)))

If anyone would be interested in full time reults, I'll drop them on
gist (I have additionally minium time, maximum, and object average)
