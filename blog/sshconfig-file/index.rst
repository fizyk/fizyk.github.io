.. title: .ssh/config file
.. slug: sshconfig-file
.. date: 2013/05/09 22:53:27
.. tags: ssh, tip
.. link:
.. description:

The *.ssh/config* file allows to configure ssh aliases in quite an elegant way. Makes obsolete the need to remember full ssh server address, port, user or possibly different authentication file you'd need to pass.

.. TEASER_END

**.ssh/config** file has lots of options, but for me, for now the most important are

.. code-block::

    Host some_server
        HostName some.server.example.com
        IdentityFile ~/.ssh/some.key
        User webmaster

Meaning, that if I run ``ssh some_server`` in reality i'll issue ``ssh -i ~/.ssh/some.key webmaster@some.server.example.com -i``.


For all configuration options read `official manpages <http://linux.die.net/man/5/ssh_config>`_ . But these two posts were most helpful for me: `Simplify Your Life With an SSH Config File <http://nerderati.com/2011/03/simplify-your-life-with-an-ssh-config-file/>`_ and `Uses for ~/.ssh/config <http://blog.sanctum.geek.nz/uses-for-ssh-config/>`_
