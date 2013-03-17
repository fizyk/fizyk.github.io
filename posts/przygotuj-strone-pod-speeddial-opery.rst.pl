.. title: Przygotuj stronę pod SpeedDial Opery
.. slug: przygotuj-strone-pod-speeddial-opery
.. date: 2011/05/14 22:05:34
.. tags: opera, speed dial
.. link:
.. description: Po ostatniej aktualizacji Opery do wersji 11.10, kilka stron w SpeedDial zmieniło wygląd. Ich miniaturki zostały zastąpione przez logo. W końcu przyjrzałem się temu mechanizmowi.

Po ostatniej aktualizacji Opery do wersji 11.10, kilka stron w SpeedDial
zmieniło wygląd. Ich miniaturki zostały zastąpione przez logo. W końcu
przyjrzałem się temu mechanizmowi.

Sama sprawa ikonki okazała się niezwykle prosta. Na dobrą sprawę
wystarczy wystarczy samo przygotowanie favikonki. Musi mieć tylko
odpowiedni rozmiar. Minimum 114 pikseli wysokości i szerokości i
maksimum 256 pikseli. Większe obrazki zostaną zmniejszone. Taka duża
ikonka może źle wyglądać w miejscach, gdzie zazwyczaj używa się
mniejszej favikonki. Jest rozwiązanie i na to:

::

    <link rel="icon" type="image/png" href="http://path/to/128x128image.png">
    <link rel="icon" type="image/png" href="http://path/to/200x200image.png">

W przykładzie tym, pierwszy link zostanie użyty tam, gdzie używana jest
zwykła favikonka, natomiast druga, większa, w SpeedDial.

Jest jeszcze kilka innych sposobów, w jaki można przygotować stronę dla
SpeedDial: css i rozpoznanie nagłówka X-Purpose. Więcej o tym można
przeczytać na stronach
Opery: \ `http://dev.opera.com/articles/view/opera-speed-dial-enhancements/ <http://dev.opera.com/articles/view/opera-speed-dial-enhancements/>`_
