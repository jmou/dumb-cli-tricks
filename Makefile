%.png: %.jpg
	convert $< -level 25%,45% $@

%.png: %.pu
	plantuml $<

cookies.txt login.html:
	curl -L -o login.html -c cookies.txt https://www.recurse.com/calendar

csrf.txt: login.html
	grep csrf-token login.html | cut -d\" -f4 | tr -d '\n' > csrf.txt

calendar.html: cookies.txt csrf.txt password
	curl -L -o calendar.html -b cookies.txt https://www.recurse.com/sessions -F email=joe@mou.fo -F 'password=<password' -F 'authenticity_token=<csrf.txt'

calendar.json: calendar.html
	grep RC.Calendar calendar.html | cut -d\" -f4 | sed -e 's/&quot;/"/g' -e 's/&amp;/\&/g' -e 's/&lt;/</g' -e 's/&gt;/>/g' -e "s/&#39;/'/g" > calendar.json

locations.txt: calendar.json
	python -m json.tool calendar.json | grep -e Sammet -e Hopper -e Turing -e Presentation | sort | uniq -c | sort -n | tail -n4 > locations.txt

%.png: %.dot
	dot -Tpng -o $@ $<

%.ps: %
	enscript -rp $@ $<

%.ps: %.txt
	enscript -rp $@ $<

%.pdf: %.ps
	ps2pdf $< $@

%.pdf: %.png
	convert $< $@

slides.pdf: a.pdf b.pdf seq.pdf Makefile.pdf dep.pdf locations.pdf y.pdf z.pdf
	pdfunite $^ $@

clean:
	git clean -fx -e password
