.. title: AJAX i document.write... nie stali w jednym domku
.. slug: ajax-i-document-write-nie-stali-w-jednym-domku
.. date: 2010/09/04 21:09:08
.. tags: recaptcha, ajax, js
.. link:
.. description: Jak się okazuje, AJAX i wywołanie w JavaScript document.write nie współgrają ze sobą. Przekonałem się o tym tworząc formularz kontaktowy, który powinien być obsługiwany również przez AJAX przy pomocy jQuery. Niestety, po dodaniu do formularza reCaptchy, wywołanie AJAXowe przestało działać poprawnie. Po wysłaniu formularza i wczytaniu go ponownie po walidacji, strona została wyczyszczona, jakby odgórnie przekierowana na stronę about:blank.

Jak się okazuje, **AJAX** i wywołanie w JavaScript **document.write**
nie współgrają ze sobą. Przekonałem się o tym tworząc formularz
kontaktowy, który powinien być obsługiwany również przez AJAX przy
pomocy **jQuery**. Niestety, po dodaniu do formularza reCaptchy,
wywołanie AJAXowe przestało działać poprawnie. Po wysłaniu formularza i wczytaniu go ponownie po walidacji, strona została wyczyszczona, jakby odgórnie przekierowana na stronę **about:blank**.

W Chrome pokazała się chociaż **reCaptcha**. Trochę mi zeszło
dochodzenie powodu takiego zachowania. Ostatnim krokiem, przed zmianą
captchy, było wyświetlenie formularza ze zwykłym
document.write('komunikat');. I w tym momencie wyszło szydło z worka,
standardowo reCaptcha jest rzeczywiście serwowana przez
**document.write()**. Na szczęście reCaptcha posiada jeszcze `API
AJAX'owe <http://code.google.com/intl/en/apis/recaptcha/docs/display.html#AJAX>`_
które zadziałało z wczytywaniem zawartości poprzez AJAX bezbłędnie.
