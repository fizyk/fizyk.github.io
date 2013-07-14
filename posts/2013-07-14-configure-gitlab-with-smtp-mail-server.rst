.. title: Configure gitlab with smtp mail server
.. tags: gitlab,smtp,howto
.. date: 2013/07/14 20:49:17
.. slug: configure-gitlab-with-smtp-mail-server
.. link:
.. description: How to configure smtp server to send emails from gtilab. This is not described nowhere within documentation, and it took me a while to configure this properly.

Probably one of the most desired features, when installing software to manage your git repository like `gitlab <http://gitlab.org/>`_, is to allow notification emails to be send. It's not the most important, but nevertheless still quite useful. And while it might be clear to people that dealt before with ruby or ruby on rails applications, it wasn't for me, and gitlab documentation hasn't mentioned it anywhere... How to configure mail sending with smtp servers!?

.. TEASER_END

Took out some digging for me and Andrew, but finally found it, so here's short instructions on this topic (Should work on gitlab 5.2 and higher, haven't tried it on lower):

First, find your **config/environments/production.rb** file. Find lines that starts with **config.action_mailer**.

Make sure to have delivery_method set to smtp like that:

.. code-block:: ruby

    config.action_mailer.delivery_method = :smtp

Now find **config/initializers/smtp_settings.rb** (You might have it as smtp_settings.rb.sample). Here's how it should look line more or less, if setting up with gmail mailbox:

.. code-block:: ruby

    if Gitlab::Application.config.action_mailer.delivery_method == :smtp
      ActionMailer::Base.smtp_settings = {
        address: "smtp.gmail.com",
        port: 587,
        user_name: "yourgmail@gmail.com",
        password: "gmai_password",
        domain: "gmail_account_domain",
        authentication: 'plain',
        enable_starttls_auto: true
      }
    end

The **domain** parameter is applicable to Google Apps account, as these are using own domains usually. Don't remeber what do you need that to set if you use regular gmail account.
