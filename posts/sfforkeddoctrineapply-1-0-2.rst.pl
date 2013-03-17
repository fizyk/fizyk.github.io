.. title: sfForkedDoctrineApply 1.0.2
.. slug: sfforkeddoctrineapply-1-0-2
.. date: 2010/03/28 22:03:05
.. tags: symfony, plugin, sfForkedDoctrineApply, vjComment, recaptcha
.. link:
.. description: Minął tydzień od opublikowania pierwszej wersji forka sfD octrineApply, a już zdążyłem w międzyczasie opublikować dwie poprawki. Nie spodziewałem się tego, ale cóż, nikt nie jest doskonały, a ja tym bardziej.

Minął tydzień od opublikowania pierwszej wersji `forka
sfD octrineApply <http://www.symfony-project.org/plugins/sfForkedDoctrineApplyPlugin>`_,
a już zdążyłem w międzyczasie opublikować dwie poprawki. Nie
spodziewałem się tego, ale cóż, nikt nie jest doskonały, a ja tym
bardziej.

Aktualna wersja 1.0.2, wypuszczona przedwczoraj poprawia w stosunku do
wersji 1.0.0 kilka elementów w polskim tłumaczeniu, dostarcza włoską
wersję językową (dostarczył Alessandro Rossi). Wszystkie akcje
znajdujące się w sfApplyActions zostały przeniesione do
sfApplyActionsLibrary, dzięki czemu można teraz komfortowo nadpisywać
poszczególne akcje. Wyszedł w tym wypadku mój brak doświadczenia z
nadpisywaniem akcji.

W chwili obecnej pracuję nad kolejną wersją, która jest prawie na
wykończeniu. W wersji tej dodałem obsługę
`reCaptcha <http://recaptcha.net/>`_ (domyślnie wyłączoną). Zanim ją
wypuszczę zreorganizuję pliki z tłumaczeniami, żeby nie wchodziły w
konflikt z innymi.

Pomysł na sposób włączenia reCaptchy do sfForkedDoctrineApply
zaczerpnąłem z
`vjCommentPlugin <http://www.symfony-project.org/plugins/vjCommentPlugin>`_,
który, już po modyfikacjach, również wykorzystam.
