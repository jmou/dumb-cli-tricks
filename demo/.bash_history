convert a.jpg -level 25%,45% a.png
make b.png
cat seq.pu
make seq.png
make calendar.html
grep RC.Calendar calendar.html | less
grep RC.Calendar calendar.html | cut -d\" -f4 | grep -o '&[^;]*;' | sort -u
man ascii
grep RC.Calendar calendar.html | cut -d\" -f4 | sed -e 's/&quot;/"/g' -e 's/&amp;/\&/g' -e 's/&lt;/</g' -e 's/&gt;/>/g' -e "s/&#39;/'/g" | less
make calendar.json
python -m json.tool calendar.json | less
python -m json.tool calendar.json | grep -e Sammet -e Hopper -e Turing -e Presentation
python -m json.tool calendar.json | grep -e Sammet -e Hopper -e Turing -e Presentation | sort | uniq -c
python -m json.tool calendar.json | grep -e Sammet -e Hopper -e Turing -e Presentation | sort | uniq -c | sort -n | tail -n4
make dep.png
make slides.pdf
xdg-open slides.pdf
make server
