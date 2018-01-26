TEX = xelatex

#target: .pdf

#.pdf: *.tex | *.sty *.cls
	#$(TEX) $<

target: demo.pdf

demo.pdf: demo.tex | *.sty *.cls
	$(TEX) $<

.PHONY: clean
clean:
	rm *~ *.aux *.log *.out *.toc *.pdf
