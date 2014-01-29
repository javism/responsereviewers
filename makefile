# Copyright Javier Sánchez-Monedero.
# Please report bugs and suggestions to (jsanchezm at uco.es)
#
# This document is released under a Creative Commons Licence 
# CC-BY-SA (http://creativecommons.org/licenses/by-sa/3.0/) 
#

# Name of your tex document (without .tex)
MAIN := reviewresponse_example

.PHONY: $(MAIN).pdf

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex
	pdflatex -interaction=nonstopmode $(MAIN).tex
	# bibtex $(MAIN)
	pdflatex -interaction=nonstopmode $(MAIN).tex

pdf: $(MAIN).pdf

view: pdf
	evince $(MAIN).pdf&

clean:
	rm -f $(MAIN).ps $(MAIN).dvi *.out *.log *.toc *.idx *~ *.blg *.bbl *.aux *# *.dvi

clean_out:
	rm -f *.pdf *.dvi *.tar.gz

dist:
	tar --exclude=".*" -czf $(MAIN).tar.gz makefile *.tex *.bib *.sty *.cls *.pdf

distzip:
	zip $(MAIN).zip makefile *.tex *.bib *.sty *.cls *.pdf

