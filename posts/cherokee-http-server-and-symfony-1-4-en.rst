.. title: Cherokee http server and symfony 1.4
.. slug: cherokee-http-server-and-symfony-1-4-en
.. date: 2011/01/08 21:01:22
.. tags: symfony, php, cherokee
.. link:
.. description: Few months ago I got directed at Cherokee http server, as it's supposed to be faster than Apache. I finally took a look at Cherokee and it seems that it's also easier to configure than Apache. Cherokee is available on Linux and BSD operating systems, and probably it's in repository of most popular distros. It's licensed with GPL license.

Few months ago I got directed at `Cherokee http
server <http://www.cherokee-project.com/>`_, as it's supposed to be
faster than Apache. I finally took a look at Cherokee and it seems that
it's also easier to configure than Apache. Cherokee is available on
Linux and BSD operating systems, and probably it's in repository of most
popular distros. It's licensed with **GPL license**.

So... how do you actually configure a symfony project with it? First of
all, you'd need to install php-cgi package, as Chreokee uses FastCGI.

Then run cherokee admin:

::

    sudo cherokee-admin

You need to run it as root, otherwise it will not be able to access
configuration files (hence sudo - I'm working on Ubuntu). You'll get
printed user name (which is **admin**) and generated one-time password.
You'll use these to access configuration panel which is usually
available at localhost:9090 address.

What do you do now? well... add new virtual host, which will run
configuration wizard for it. There, under platforms, you'll see symfony
option next to *Zend Framework*, *Ruby on Rails* and *Django*. There are
some other options to choose from, if you want, and what is most
surprising, about half of them is for php solutions.

However we'll choose symfony. In the next step, you'll have to type in
two paths:

-  to your symfony's project web folder
-  and to symfony's data folder (has to be *symfony/data* folder, not
   just *symfony*)

After pressing next, all you need to do is to choose your host name, and
create your new virtual host.

Oh, almost forgot, one more thing. You'll need to save all that by
pressing save in the cherokee's admin interface. It'll trigger server
restart (hard or gentle) after which you'll be able to enjoy your
symfony virtual host.

There's one thing you have to be careful about. If there'll be problems
with access to files, like insufficient rights, or possibly wrong group,
you'll probably get the file not found error, and it'll not be the on
served by symfony.

So far I haven't noticed much difference between Apache and Cherokee on
my dev machine. And I have seen project called
`symfttpd <https://github.com/laurentb/symfttpd/>`_ which is aimed at
symfony developers. Symfttpd provids them with "embed" http server (uses
`lighttpd <http://www.lighttpd.net/>`_). This solution should be more
suited for developer's machine, although it doesn't support Windows as
well. It reminds of those built in web servers that can be found in Ruby
on Rails or python's frameworks like `web2py <http://www.web2py.com/>`_
for example.

Next steps will be to check how does symfttpd works and how to run
`symfony2 <http://www.symfony-reloaded.org/>`_ project on cherokee (as
soon as I'll start one).
