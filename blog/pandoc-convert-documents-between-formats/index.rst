.. title: Pandoc: Convert documents between formats
.. slug: pandoc-convert-documents-between-formats
.. date: 2013/04/27 21:01:13
.. tags: python,pandoc,tools,tip
.. link:
.. description:

Here's another post from my recent migration to Nikola. On my engine, I stored posts in databse in html, but writing Nikola, I wanted to use reStructuredText format. And while I probably could leave out old posts in html, I thought it would be only for the best to find a simple way, and reformat all my posts into rst files.

.. TEASER_END

After some digging around, I found `Pandoc <http://johnmacfarlane.net/pandoc/index.html>`_. It supports lots of formats between it can convert documents: Markdown, reStructuredText, AsciiDoc, MediaWiki markup, LaTeX, epub, docx, odt, html, PDF. Even though it does not have python API, it still can easily used in python programs. Such program just needs to store source into a file first, run **pandoc** in subprocess, and then read the output file.

Using subprocess call, I've been able to convert html documents into rst ones.

.. code-block:: python

    import subprocess

    html_code = 'Here's an html code'

    with open('doc.html', 'w') as doc_html:
        doc_html.write(html_code)

    subprocess.call(['pandoc', 'doc.html', '-w', 'rst', '-o', 'doc.rst'])

    with open('doc.rst', 'r') as doc_rst:
        rst_code = doc_rst.read()


Few issues were present within rst documents generated this way, but still I was able to convert my html posts into rst within 15 minutes including correcting those issues.
