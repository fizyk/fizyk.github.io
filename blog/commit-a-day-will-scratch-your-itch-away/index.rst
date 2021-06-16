.. title: Commit a day, will scratch Your itch away
.. slug: commit-a-day-will-scratch-your-itch-away
.. date: 2014-09-04 23:03:07 UTC+02:00
.. tags: python,community,open source
.. link:
.. description:
.. type: text

At August's **wroc.py** meeting I had a brief discussion with `Tomek Wójcik <http://www.bthlabs.pl/>`_ about `Envelopes <http://tomekwojcik.github.io/envelopes/>`_'s state, and those long opened issues at his issue tracker.

While thinking about what Tomek said, I remembered reading `Jeff Knupp's <http://jeffknupp.com/>`_ post about `whizbang project <http://jeffknupp.com/blog/2014/05/30/you-need-to-start-a-whizbang-project-immediately/>`_, a highly motivational post about willingness to do something - and it got me thinking... What makes project tick? Why does Django, Twisted, Celery have grown so big?

.. TEASER_END

Most of the open source project have started as someone's pet projects, usually to help solve a particular problem, that project's author has been facing. Like Jeff Knupp's - `sandman <http://jeffknupp.com/blog/2013/07/23/sandman-a-boilerplatefree-python-rest-api-for-existing-databases/>`_, or envelopes mentioned in the beginning. Those per projects gain popularity, when others find it helpful, but popularity is not enough. What matters, is traction.

Traction
--------

Traction is when a project gets a circle of "continuous contributors", that use project, report bugs and ideally contribute code, in the end taking off the weight of maintaining a project from the original author. Where Django, or pyramid would be if they were still developed by a single person?

Both projects kicked in at the beginning. But both at a different places. While sandman seems to be thriving, Envelopes is stuck with most recent commit from over a year ago. What's the difference? Tomek, as I talked with him, was happy with where Envelopes got, it did what Tomek expected it to do. What differs with sandman, it's that Jeff Knupp constantly tinkers around it.

Bug reports/feature requests are great, but...
----------------------------------------------

I've asked Tomek what's up with Envelopes, because it haven't progressed a bit in almost a year, and there are years old issues opened. His response was quite interesting. He developed it on train, if I remember correctly, to solve his problem, and presented to the world. The still servers its purpose for Tomek, and he doesn't have time or need to tinker around Envelopes, especially that it works. If he hadn't started working on something, it means that he probably won't. But he would happily accept pull requests, even write tests or documentation for that code.

And I though, open issues are great, but what really matters for most project is code contribution. And hence a motto of this post:

**Commit a day, will scratch Your itch away**
---------------------------------------------

Because we're developers, we know our way around the code. We usually use lots of open source projects in work, and find some use cases author could not think about. And following the use cases are usually new bugs.

Least we can do is to file a bug report. But while we're at filing a bug reports, let's try to triage it to the limit - communicate as detailed and clear as we can - it'll speed up the fix. You might be asked by author for details to help triage a bug anyway. From there, we're usually only a one step from making a commit ourselves and contributing code. And no matter if it's a working solution, or a test case exposing bug in question - it's a commit that moves You, package and author forward.
