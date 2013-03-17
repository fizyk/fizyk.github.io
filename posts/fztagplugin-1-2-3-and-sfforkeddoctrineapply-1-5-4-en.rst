.. title: fzTagPlugin 1.2.3 and sfForkedDoctrineApply 1.5.4
.. slug: fztagplugin-1-2-3-and-sfforkeddoctrineapply-1-5-4-en
.. date: 2010/11/29 23:11:49
.. tags: symfony, plugin, sfForkedDoctrineApply, fzTag, php
.. link:
.. description: I had to quite fast update both fzTagPlugin and sfForkedDoctrineApply, and since Me and several other users discovered some bugs just after I thought it's all fixed, both plugins had several releases. Crazy sunday as it might seem.

I had to quite fast update both fzTagPlugin and sfForkedDoctrineApply,
and since Me and several other users discovered some bugs just after I
thought it's all fixed, both plugins had several releases. Crazy sunday
as it might seem.

For fzTagPlugin, it looks like I forgot to apply the limit to tag cloud
query after randomizing it and yet. So in fact tag cloud became tag fog,
or tag storm. This has been fixed for `fzTagPlugin
1.2.3 <http://www.symfony-project.org/plugins/fzTagPlugin>`_,
unfortunately, had to actually use two queries, to get most used tags in
random order, since it was quite impossible to useLIMIT in subquery. You
can see the outcome, using tagCanvas component at the bottom of my menu
column.

List of changes for
fzTagPlugin: \ `https://github.com/fizyk/fzTagPlugin/compare/1.2.1...1.2.3 <https://github.com/fizyk/fzTagPlugin/compare/1.2.1...1.2.3>`_

For sfForkedDoctrineApplyPlugin,there were some painful leftovers from
dumbing Profile's email field. Should be fixed in
`sfForkedDoctrineApplyPlugin
1.5.4 <http://www.symfony-project.org/plugins/sfForkedDoctrineApplyPlugin>`_.
Next step here should be OpenID and Facebook login integration.

List of changes for
sfForkedDoctrineApplyPlugin: \ `https://github.com/fizyk/sfForkedDoctrineApplyPlugin/compare/1.5.0...1.5.4 <https://github.com/fizyk/sfForkedDoctrineApplyPlugin/compare/1.5.0...1.5.4>`_
