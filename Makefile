SHELL := /bin/bash

export TIMESTAMP=$(shell date +"%s")
export pwd=$(shell pwd)

.PHONY: all
all: install check

.PHONY: install
install:
	rtx install
	mix deps.get

.PHONY: check
check:
	mix test
	mix format --check-formatted
	mix coveralls.html --exclude integration --include coveralls_safe
	mix docs

.PHONY: coveralls.html
coveralls.html:
	mix coveralls.html --exclude integration --include coveralls_safe

.PHONY: clean
clean:
	mix clean
	mix deps.clean --all

.PHONY: recompile
recompile: clean
	mix deps.get
	mix compile
