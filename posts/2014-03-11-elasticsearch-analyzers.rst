.. title: Elasticsearch analyzers
.. slug: elasticsearch-analyzers
.. date: 2014/03/11 22:14:06
.. tags: elasticsearch
.. link:
.. description:
.. type: text

`Elasticsearch <http://www.elasticsearch.org/>`_ is all the buzzwords recently.
There are projects using it to fast distributed search, as a document database
and as a tool for data analysis. I've wanted to check out Elasticsearch for
some time already, even more, since I've been at `lecture about aggregations
in Elasticsearch <https://www.youtube.com/watch?v=yZu4jQtBUPg>`_
by **Honza Král** at PyConPL 2013 . I recently got a chance to check it out
migrating project from whoosh to elasticsearch. And first thing I noticed about
Elasticsearch from solutions I've been using so far are analyzers.

.. TEASER_END

Unlike **Sphinx** or **Whoosh**, where you determine how to analyze a field
by search engine, in Elasticsearch, you define an **analyzer** for a field
to analyze both the field, and query for the field as well.

.. code-block:: json

    {
        "mappings": {
            "document": {
                "properties": {
                    "title": {
                        "type": "string",
                        "analyzer": "autocomplete_analyzer",
                    }
                }
            }
        }
    }

This mapping definition will cause Elasticsearch to index title field according
to autocomplete_analyzer and query as well. That's fine for most cases,
but eg. for autocomplete usually tries to suggest where user can go further
from what he typed, not what else he might have typed in.

Elasticsearch provides a possibility to define separate analyzer
**index_analyzer** for index and **search_analyzer** for search query.

.. code-block:: json

    {
        "mappings": {
            "document": {
                "properties": {
                    "title": {
                        "type": "string",
                        "index_analyzer": "autocomplete_analyzer",
                        "search_analyzer": "simple"
                    }
                }
            }
        }
    }

This will allow to limit suggestions to take account whole words user has
already typed in. There's one caveat though. If you leave also the default
analyzer definition, elasticsearch won't take into account *index_analyzer*
and *search_analyzer,* but will create an additional **search_query_analyzer**.
And this, at least for me, haven't returned the results I expected.

Of course, if you standard analyzers won't be what you seek, there's always an
option to define custom analyzers, custom tokenizers, and custom filters.
