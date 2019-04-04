%.ps: %
	enscript -rp $@ $<

%.ps: %.txt
	enscript -rp $@ $<

%.pdf: %.ps
	ps2pdf $< $@

%.pdf: %.png
	convert $< $@

slides.pdf: a.pdf b.pdf seq.pdf Makefile.pdf dep.pdf locations.pdf .x.pdf .z.pdf
	pdfunite $^ $@
