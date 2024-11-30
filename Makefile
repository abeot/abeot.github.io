.PHONY: all html

all: build static/resume.pdf static dirs html

build:
	mkdir build

clean: build
	rm -r build/*.html

dirs:
	-mkdir build/writing
	-mkdir build/code
	-mkdir build/math

html:
	./generate-html.sh

static: build
	-cp $(PWD)/static/main.css /build/main.css
	-cp $(PWD)/static/resume.pdf /build/resume.pdf

static/resume.pdf:
	cd static && pdflatex resume.tex
