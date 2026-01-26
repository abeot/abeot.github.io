.PHONY: all html

all: build static dirs html

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
	-cp -r $(PWD)/static/ build/

