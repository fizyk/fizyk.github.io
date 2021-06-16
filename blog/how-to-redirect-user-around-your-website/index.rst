.. title: How to redirect user around Your website?
.. slug: how-to-redirect-user-around-your-website
.. date: 29.05.2014 20:15:20 UTC+02:00
.. tags: http,3xx,fullauth
.. link:
.. description:
.. type: text

Recently I've read quite interesting chapter of a **Scalability Rules** book.
Well... chapter alone wasn't that interesting, but one thing struck me and seemed
quite important. That is How do we redirect user while having Post-Redirect-Get
flow on an asset he can create, edit.

.. TEASER_END

Post-Redirect-Get is usually handling content creation (or editing) and it's main
purpose is to prevent data duplication. Without it, it's easy to just refresh and
repeat POST request all together resulting in such well known double-posts (and third,
with apologies after that).

Well.. for a long time I've been sticking with **302 Found** redirect. I do not
remember where I've got it, but what actually 302 means is that it found requested
result. Original (HTTP1) 302 was even worse for that kind of flow, since it said
*Moved* **Temporarily** - so what webserver was usually telling - was, this time
look at that url (no matter it was usually same one).

Chapter in the book in question actually opened my eyes to **303 See Other** - that
says that requested resource can be accessed under **this uri** using **GET** request.
And while posting some data, it also means that server received and processed the
data sent to it.

Having learnt that, I modified pyramid_fullauth code accordingly. Which resulted in `0.3.2 version <https://pypi.python.org/pypi/pyramid_fullauth/0.3.2>`_.


