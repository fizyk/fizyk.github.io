.. title: sfForkedDoctrineApplyPlugin 1.5.9
.. slug: sfforkeddoctrineapplyplugin-1-5-9
.. date: 2011/08/02 21:08:54
.. tags: symfony, sfForkedDoctrineApply, php
.. link:
.. description: sfForkedDoctrineApply just got updated to new version - 1.5.9. It contains Portuguese translation created by Alan Candido, so I hope it will get useful for even more people now.

sfForkedDoctrineApply just got updated to new version - 1.5.9. It
contains Portuguese translation created by Alan Candido, so I hope it
will get useful for even more people now.

.. TEASER_END

Another change is a small change in register form, where postValidators
were replaced by preValidators (thanks to Charles Bourasseau). This
change prevents double error on email addresses in case someone tries to
register with existing email, he would get two errors, one that the
email is already in use, second, that the email confirmations field
doesn't match. Now it should be fixed.

As usual, some plugin's links:

- `Changes made since 1.5.8 version can be viewed here <https://github.com/fizyk/sfForkedDoctrineApplyPlugin/compare/v1.5.8...v1.5.9>`_
- `Symfony page <http://www.symfony-project.org/plugins/sfForkedDoctrineApplyPlugin/1_5_9>`_
- `Github page <https://github.com/fizyk/sfForkedDoctrineApplyPlugin/tree/v1.5.9>`_

