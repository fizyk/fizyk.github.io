.. title: symony2 project from scratch
.. slug: symony2-project-from-scratch
.. date: 2011/01/18 21:01:38
.. tags: symfony, php, symfony2, howto
.. link:
.. description: In my opinion, the best way to learn something is to do it from scratch. So I always had a problems when math teacher started to show-short cuts calculations, but were actually good at them after I learned what the calculation short-cuts were replacing. So... after seeing the symfony2 sandbox application, I decided to create symfony2 application from scratch.

In my opinion, the best way to learn something is to do it from scratch.
So I always had a problems when math teacher started to show-short cuts
calculations, but were actually good at them after I learned what the
calculation short-cuts were replacing. So... after seeing the `symfony2
sandbox <https://github.com/symfony/symfony-sandbox>`_ application, I
decided to create `symfony2 <http://www.symfony-reloaded.org/>`_
application from scratch.

.. TEASER_END

First, I looked at the possibility to generate application skeleton in
similar way we can generate for **symfony 1.4**. It took me a while,
before I found this neat article "`symfony2 project
initialization <http://blog.bearwoods.dk/symfony2-project-initilization>`_\ "
by *Henrik Bjørnskov*. Fortunately, the problem Henrik was writing about
when he  was writing his article, has been resolved. So, the
instructions are actually quite simple, but let me repeat them.

So, before you start, you have to get (preferably recent) version of
symfony-bootstrapper project. You can download it from it's github pages
here:
`https://github.com/symfony/symfony-bootstrapper <https://github.com/symfony/symfony-bootstrapper>`_,
or clone it:

.. code-block:: bash

    git clone git://github.com/symfony/symfony-bootstrapper.git

The second is actually better choice, since you can update your
bootstrapper with one command later:

.. code-block:: bash

    cd symfony-bootstrapper
    git pull

So... we downloaed bootstrapper, let us create project. First, let's
create folder for our project:

.. code-block:: bash

    mkdir /path/to/symfony2/project

or

.. code-block:: bash

    mkdir /path/to/symfony2/project -p

Where project is the folder we're creating, then, go to that folder:

.. code-block:: bash

    cd /path/to/symfony/project

From there run:

.. code-block:: bash

    php path/to/bootstrapper/symfony.phar init --name="Symfony2Project" --format="xml"

Now note, there is/was a bug in **config.xml**, so if you choose your config to be stored in xml, make sure, that you reorder your section to look like this:

.. code-block:: xml

    <app:config charset="UTF-8" csrf-secret="xxxxxxxxxx" error-handler="null">
        <app:router resource="%kernel.root_dir%/config/routing.xml"/>
        <app:validation annotations="true" enabled="true"/>
        <app:session auto-start="true" default-locale="en" lifetime="3600"/>
        <app:templating assets-version="SomeVersionScheme"/>
    </app:config>


Mind the order of app:session and app:templating. It won't work the
other way. I've submitted reordered config.xml file, and this change was
pulled, but that's in skeleton folder, and it isn't actually in the phar
archive (I have no idea, how to create/update it... yet) so probably
you'll need to introduce that change as well.

What now? You'll need to download vendor libraries. So, let us download
Symfony first, you can just clone it, like Henrik wrote in his post, but
since I place all my projects in git repo, it made more sense to use
sumbodules (and learn how to work with it):

.. code-block:: bash

    git submodule add git://github.com/symfony/symfony.git src/vendor/symfony/
    git submodule init
    git submodule update

Symfony uses Zend\_Logger, so you'll need at least that as well. It
isn't shipped with symfony2, but it's enough to copy it from sandbox
package. it has exactly what we need, nothing more. But if you'd like to
use more Zend Framework libraries, you can clone it from github as well,
just like Henrik in his `post
wrote <http://blog.bearwoods.dk/symfony2-project-initilization>`_.

Another library which is rather must, is **Twig**, you can download it
from `www.twig-project.org <http://www.twig-project.org/>`_, but even if
there's RC version available, it is version downloaded from Twig's
`master branch on github repo <https://github.com/fabpot/twig>`_ which
works, not RC1. And again, you can clone it:

.. code-block:: bash

    git clone git://github.com/fabpot/Twig.git src/vendor/twig

or submodule it:

.. code-block:: bash

    git submodule add git://github.com/fabpot/Twig.git src/vendor/twig
    git submodule init
    git submodule update

I tried to comment it out, but got error, that there's anything that can
use twig configuration options.

At this point your app will yell for you at the lack of Doctrine, but
you can just comment it out in yours app Kernel:

.. code-block:: php5

    class Symfony2ProjectKernel extends Kernel
    {

        public function registerBundles()
        {
            $bundles = array(
                new Symfony\Bundle\FrameworkBundle\FrameworkBundle(),
                new Symfony\Bundle\TwigBundle\TwigBundle(),

                 // enable third-party bundles
                 new Symfony\Bundle\ZendBundle\ZendBundle(),
                 new Symfony\Bundle\SwiftmailerBundle\SwiftmailerBundle(),
                 //new Symfony\Bundle\DoctrineBundle\DoctrineBundle(),
                 //new Symfony\Bundle\DoctrineMigrationsBundle\DoctrineMigrationsBundle(),
                 //new Symfony\Bundle\DoctrineMongoDBBundle\DoctrineMongoDBBundle(),
                 //new Symfony\Bundle\PropelBundle\PropelBundle(),

                 // register your bundles
            );

            if ($this->isDebug()) {
                $bundles[] = new Symfony\Bundle\WebProfilerBundle\WebProfilerBundle();
            }

            return $bundles;
        }

        //...........
    }

I know, there's swiftmailer bundle, but well... Doesn't use anything
third party at the moment.

There's one last thing to do, before we can look at our fresh, clean
symfony2 project:

.. code-block:: bash

    ./app/console assets:install web/

It copies bundles assets into web/ folder just like command below did in
symfony 1.4:

.. code-block:: bash

    ./symfony plugin:publish-assets

You can of course create symbolic links:

.. code-block:: bash

    ./app/console assets:install web/ --symbolic

But if you install bundle's assets like that, you might have problems
with loading your project through some ftp clients.

Now, you have you shiny symfony2 project up and running. Now you can
start to create your own controllers and build some nice looking layout.

.. note::

    You should install php5-sqlite package from you repo (on linux), to use Symfony's **WebProfiler**!

