.. title: Decrease number of queries for admin generated module: the better way
.. slug: decrease-number-of-queries-for-admin-generated-module-the-better-way
.. date: 2011/02/14 21:02:50
.. tags: symfony, php, admin generator, query
.. link:
.. description: Recently I saw two posts in the symfony blogosphere about decreasing number of queries in admin generated module (in January on Techie Corner, and today on Symfony world - which prompted me to write this post). And both bloggers seemed to be happy with overwriting buildQuery method of the module's action class. But generator.yml provides more elegant solution for admin generated modules.

Recently I saw two posts in the symfony blogosphere about decreasing
number of queries in admin generated module (in January on `Techie
Corner <http://www.techiecorner.com/1963/how-to-reduce-admin-generator-query-in-symfony-1-4/>`_,
and today on `Symfony
world <http://symfony-world.blogspot.com/2011/02/less-doctrine-queries-in-symfony-admin.html>`_
- which prompted me to write this post). And both bloggers seemed to be
happy with overwriting buildQuery method of the module's action class.
But **generator.yml** provides more elegant solution for admin generated
modules.

.. TEASER_END

When I first saw that solution on techiecorner, I thought: "*hmmm.. that
could be useful*\ ", but then, I looked at my generator.yml file and saw
**table\_method** i placed there long time ago...

.. code-block:: yaml

    generator:
      param:
        config:
          list:
            table_method: getAdminNotes

And while both, overwriting buildQuery and setting table\_method can
achieve same goal, I think table\_method is more elegant, as it keeps
your query in your ModelTable, and can be reused in other part of your
project as well.

See \ `The symfony Reference
Book <http://www.symfony-project.org/reference/1_4/en/06-Admin-Generator#chapter_06_sub_table_method>`_.
