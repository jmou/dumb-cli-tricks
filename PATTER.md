## prep

    $ source .bashrc
    :so .macros.vim

## title

Give a presentation. Haven't made it yet. Let's do it together!

## ImageMagick

Ugly glare. Adjust levels (black point and white point).

    $ convert a.jpg -level 25%,45% a.png
    $ make b.png

## make

    :e Makefile
    a.png: a.jpg
    	convert a.jpg -level 25%,45% a.png

    b.png: b.jpg
    	convert b.jpg -level 25%,45% b.png

## implicit rules

Similar rules can use % as wildcard.

    %.png: %.jpg
    	convert $< -level 25%,45% $@

## scrape

Scrape a web page. What's involved? Use plantuml to make a sequence diagram.

    %.png: %.pu
    	plantuml $<
    $ cat seq.pu
    $ make seq.png

Two sets of requests.

    :r .scrape.mk
    $ make calendar.html

## calendar

RC.Calendar is interesting.

    $ grep RC.Calendar calendar.html | less

Lots of HTML entities. Which ones? sed substitutions.

    $ grep RC.Calendar calendar.html | cut -d\" -f4 | grep -o '&[^;]*;' | sort -u
    $ man ascii
    $ grep RC.Calendar calendar.html | cut -d\" -f4 | sed -e 's/&quot;/"/g' -e 's/&amp;/\&/g' -e 's/&lt;/</g' -e 's/&gt;/>/g' -e "s/&##39;/'/g" | less

We have JSON! Pretty print it.

    $ make calendar.json
    $ python -m json.tool calendar.json | less

Look for conference rooms.

    $ python -m json.tool calendar.json | grep -e Sammet -e Hopper -e Turing -e Presentation
    $ python -m json.tool calendar.json | grep -e Sammet -e Hopper -e Turing -e Presentation | sort | uniq -c
    $ python -m json.tool calendar.json | grep -e Sammet -e Hopper -e Turing -e Presentation | sort | uniq -c | sort -n | tail -n4

## graphviz

Would be nice to see the relationship between make inputs and outputs.
Dependency graph.

    %.png: %.dot
    	dot -Tpng -o $@ $<
    :e dep.dot
    $ make dep.png

## slides

Some cool command line tools, but what about making slides?
Because of the rules we put in, make knows all the commands to be run.

    :r .slides.mk
    $ make slides.pdf
    $ xdg-open slides.pdf

## http

Share with a friend!

    $ python3 -m http.server

Doesn't actually make an output file. Handy way to run commands.

## conclusion

What was the point? Dumb CLI tricks = stupid fast.
Next time you think about spending 20 minutes writing throwaway code,
maybe you can just cobble together a couple CLI tools.
