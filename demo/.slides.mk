%.ps: %
	enscript -rp $@ $<

%.ps: %.txt
	enscript -rp $@ $<

%.pdf: %.ps
	ps2pdf $< $@

%.pdf: %.png
	convert $< $@

slides.pdf: IMG_4363.pdf IMG_4365.pdf sequence.pdf Makefile.pdf dependencies.pdf locations.pdf .IMG_4370.pdf .IMG_4371.pdf
	pdfunite $^ $@
