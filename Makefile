TEX = xelatex
BIBTEX = bibtex 
OPEN = open

OBJECTS = demo.pdf
target: $(OBJECTS)

demo.pdf: *.tex *.sty *.cls 
	$(TEX) -shell-escape $<
	#$(BIBTEX) demo.aux
	#$(TEX) -shell-escape $<
	$(TEX) -shell-escape $<
	$(OPEN) $@


.PHONY: clean 

clean:
	rm -f *~ *.aux *.log *.out *.toc *.bbl *.blg
	rm -rf _minted-cache
