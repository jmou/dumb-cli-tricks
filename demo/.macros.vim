let @q = "ia.png: a.jpg\n convert a.jpg -level 25%,45% a.png\n\nb.png: b.jpg\n convert b.jpg -level 25%,45% b.png\e"
let @w = 'gg^s%Ws%jWWcW$<$BC$@Gdap:w'
let @e = 'Go%.png: %.puplantuml $<:w'
let @r = 'G:r .scrape.mk[ :se wrap:w'
let @t = 'Gocalendar.json: calendar.htmlgrep RC.Calendar calendar.html | cut -d\" -f4 | sed -e ''s/&quot;/"/g'' -e ''s/&amp;/\&/g'' -e ''s/&lt;/</g'' -e ''s/&gt;/>/g'' -e "s/&#39;/''/g" > calendar.json:w'
let @y = 'Golocations.txt: calendar.jsonpython -m json.tool calendar.json | grep -e Sammet -e Hopper -e Turing -e Presentation | sort | uniq -c | sort -n | tail -n4 > locations.txt%.png: %.dotdot -Tpng -o $@ $<:w'

let @a = ":v/: /d\n"
let @s = ":%s/:/ ->/\n"
let @d = ":%s/\\w*\\.\\w*/\"&\"/g\n"
let @f = ":%s/$/;/\n2gg0WWi{ $i }"
let @g = ":noh\nggOdigraph G {\eGo}\e=%:w\n"

let @z = 'G:r .slides.mk[ zz:w'
let @x = 'Goserver: slides.pdfpython3 -m http.server:w'
