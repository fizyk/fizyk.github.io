.. title: symfony command line tool with custom php.ini
.. slug: symfony-command-line-tool-with-custom-php-ini-en
.. date: 2011/01/12 19:01:14
.. tags: symfony, php, cache
.. link:
.. description: I recently changed hosting service provider. It's acutally quite great. It's shared hosting, so it's not that expensive like vps, got secure shell (ssh) access and it serves website much faster than previous hoster. Plus I got the place to play with python, php5.3, and if (or rather when) I'd turn to it as well, Ruby on Rails.

I recently changed hosting service provider. It's acutally quite great.
It's shared hosting, so it's not that expensive like vps, got secure
shell (ssh) access and it serves website much faster than previous
hoster. Plus I got the place to play with python, php5.3, and if (or
rather when) I'd turn to it as well, Ruby on Rails.

.. TEASER_END

Currently I'm still enjoying my ssh access, but discovered some
nuisance. I can have my own php.ini for web access but then got no
access to php-cli settings. So at first, when I turned on APC cache for
my homepage, It was running on APC, but I couldn't manually clear cache,
since command line php hadn't had apc module enabled.

So after a little bit of thinking, I created a wrapper for symfony
execute. It's small bash script, that runs symfony execute with my
webserver php.ini file and passes all it's parameters to symfony command
line tool:

.. code-block:: bash

    #!/bin/bash

    php -c /path/to/php.ini symfony $@

But there's a question, why bother with this, when I can just run this
code from command line?

Well... If I got an execute that already runs by itself, why should I
pass it directly to php? And coming to that... typing each time path to
php.ini? No thanks!

Still have some issues to clear with apc in my app (cache is quite
complex issue), but at least I no longer have error message in my cli,
that I have to enable it APC, before I use it in project. Still
question, which is better for standalone app cache: APC or memcached?
And how to use both?
