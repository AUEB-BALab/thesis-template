BUILD = build
SRC = docs
FIGURE = figs
PDF = $(BUILD)/thesis.pdf

.PHONY: all prepare

all: $(PDF)
	-rm thesis.pdf
	ln -s $(PDF) thesis.pdf

$(BUILD):
	mkdir build

prepare: $(BUILD) 
	cp $(SRC)/*.tex build 
	cp $(SRC)/*.bib build
	cp $(FIGURE)/*.pdf $(FIGURE)/*.png build | true

$(PDF): prepare
	cd $(BUILD) && \
	pdflatex thesis.tex && \
	bibtex thesis && \
	pdflatex thesis.tex

clean:
	rm -rf build
	find . -type f -name .DS_Store | xargs rm -f
	find . -type f | grep "~$$"| xargs rm -f
