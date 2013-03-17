.. title: Sort doctrine Model by default
.. slug: sort-doctrine-model-by-default
.. date: 2011/02/16 22:02:06
.. tags: symfony, doctrine, fzTag
.. link:
.. description: Recently, I thought, that it would be great to sort by default tags from fzTagPlugin by weight anywhere. So I started to look, as I remembered to read a while ago about an option that can be set on relations. I finally found it but... it's not suitable for many-to-many relations, which is used for tags.

Recently, I thought, that it would be great to sort by default tags from
`fzTagPlugin <http://www.symfony-project.org/plugins/fzTagPlugin>`_ by
weight anywhere. So I started to look, as I remembered to read a while
ago about an option that can be set on relations. I finally found it
but... it's not suitable for many-to-many relations, which is used for
tags.

It took me two days to find that article (`Did you know
that... <http://test.ical.ly/2010/09/30/did-you-know-that-you-can-sort-your-doctrine-relations-by-setting-an-orderby-option-in-your-schema/>`_)
again, and there, in the comments I found what I was looking for. It is
even simpler than setting orderBy for relation, you can set up orderBy
for entire model:

::

    fzTag:
      options:
        orderBy: weight DESC

Now, after building up model, doctrine adds that sorting to your query
unless you set up your own orderBy settings. Everything looks and works
great, unless you actually try to retrieve tagged object and tags in one
query.

::

    ObjectTable::getinstance() ->createQuery('a')->leftJoin('a.Tags t');

After that Doctrine tries to sort both by weight both tags and
association table.

::

    SELECT * FROM object o 
        LEFT JOIN object_fz_tag o2 ON (o.id = o2.id) 
        LEFT JOIN fz_tag f ON f.id = o2.tag_id 
    ORDER BY f.weight DESC, o2.weight DESC;

And even if it worked, would you dare to guess how would object's list
looked like? Well... it would probably be sorted by tag's weight, unless
you'd add your own order by. But then would have to set orderBy on tags
as well.
