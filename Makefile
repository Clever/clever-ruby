.PHONY: all test build run
SHELL := /bin/bash

all: test build

test:
	echo "TODO test app"

build:
	cd override && ./override.sh