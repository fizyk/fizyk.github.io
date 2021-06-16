.. title: Reminder to use pool_recycle for SQLAlchemy's connection to mysql
.. slug: reminder-set-pool_recycle-for-sqlalchemys-connection-to-mysql
.. date: 2014-08-19 22:02:27 UTC+02:00
.. tags: sqlalchemy,mysql
.. link:
.. description:
.. type: text

This post is a reminder to myself and maybe other that will stumble upon
"**Mysql server has gone away**" error with `SQLAlchemy <http://docs.sqlalchemy.org>`_.

Recently, we had problem **again** with MySQL and SQLAlchemy application, that it lost
connection, resulting in this error. While a colleague of mine started panicking,
I've started to remind myself, how did we solved it last time.

Well.. the answer is simple, we used `pool_recycle <http://docs.sqlalchemy.org/en/rel_0_9/core/pooling.html#setting-pool-recycle>`_
because mysql closes itself stale connections.

I don't think this problem occurs with postgresql, at least I haven't seen it
anywhere with postgresql, but for MySQL it's certainly worth trying first
**pool_recycle** option, and tuning pooling in general, before franticly browsing
internet for *possible* cause of this broad error.
