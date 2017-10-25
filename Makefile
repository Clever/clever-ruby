.PHONY: all test build run
SHELL := /bin/bash

all: test build

test:
	bundle install && bundle exec rake spec

build:
	./override/override.sh
