TEX = xelatex
OPEN = open

OBJECTS = demo.pdf
target: $(OBJECTS)

demo.pdf: *.tex *.sty *.cls 
	$(TEX) $<
	$(TEX) $<
	$(OPEN) $@


.PHONY: clean 

clean:
	rm -f *~ *.aux *.log *.out *.toc *.pdf
