.. title: fzTagPlugin 1.2.4
.. slug: fztagplugin-1-2-4-en
.. date: 2011/01/02 20:01:52
.. tags: symfony, plugin, fzTag, php
.. link:
.. description: This version of fzTagPlugin is mostly about enhanced performance. There's added index on weight field, and some refactoring. All these changes should affect positively performance of your app.

This version of fzTagPlugin is mostly about enhanced performance.
There's added index on weight field, and some refactoring. All these
changes should affect positively performance of your app.

Since this version, each tag cloud uses only half of the queries, it
used to. There were two queries declared (doctrine splits them into four
queries), now tag cloud uses only one (doctrine splits it in two).

Also setting tags was changed. Before each time object was edited, all
it's tags were removed and added again (legacy cod from diem's version).
fzTagPlugin no longer behaves like that. Since this version only tags
added are beeing add and only those removed are beeing removed.

-  Changelog can be read
   `here <https://github.com/fizyk/fzTagPlugin/compare/1.2.3...v1.2.4>`_.
-  Plugin's release on symfony pages:

   `http://www.symfony-project.org/plugins/fzTagPlugin/1\_2\_4 <http://www.symfony-project.org/plugins/fzTagPlugin/1_2_4>`_
-  Plugin's version on github repository:

   `https://github.com/fizyk/fzTagPlugin/tree/v1.2.4 <https://github.com/fizyk/fzTagPlugin/tree/v1.2.4>`_

