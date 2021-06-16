.. title: Differences between Django and Pyramid routing
.. tags: python, django, pyramid, routing
.. date: 2013/06/23 22:35:48
.. slug: differences-between-django-and-pyramid-routing
.. link:
.. description:

Recently I had a chance to familiarize myself with django framework. Having some experience with Pyramid (with SQLAlchemy), I can't stop myself comparing these two frameworks. The first big difference, which struck me, was routing.

.. TEASER_END

While pyramid's routing is marvellously flexible, django is somewhat limited. Even though it utilises regular expression for route patterns, it looks more crude, than what's pyramid offering. I'm aware, that I'm not familiar with everything in django yet, but that's my first impression.

Drawback for me is also having one route per action. I used pyramid view_onfig's predicates in pyramid quite extensively, so, whenever I had chance, I had three action to serve one entity (simplest way in edit: GET request had it's own action, and POST was the other, all on one route).

The route predicates was another great thing behind pyramid routing. Route pattern were rather simple, but predicates are what makes this routing system great. I could check if I had slug/id even before I got to the view, no need to throw 404 exception in the view in case entity does not exists... And while we're at it, pregenerators. I could have whatever route params defined, and pass objeck as user, and just remap object into parameters in pregenerator.

The pregenerator is still far in case of ease of use behind symfony 1.4, where such pregenerator action would be just a routing config, but still, way better than what I see in django, at least at the moment.

Some reading:

* `Django routing <https://docs.djangoproject.com/en/1.5/topics/http/urls/>`_
* `Pyramid routing <http://docs.pylonsproject.org/projects/pyramid/en/1.4-branch/narr/urldispatch.html>`_
* Great post by Carlos de la Guardia, where he's `enumerating possibilities pyramid routing gives you <http://blog.delaguardia.com.mx/pyramid-view-configuration-let-me-count-the-ways.html>`_
