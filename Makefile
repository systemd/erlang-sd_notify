REBAR3 ?= $(shell which rebar3 2>/dev/null || which ./rebar3)

REBAR_FLAGS ?=

all: compile

compile:
	$(REBAR3) compile $(REBAR_FLAGS)
	
check: test
test: clean compile
	rm -rf _build
	$(REBAR3) eunit $(REBAR_FLAGS)

clean:
	$(REBAR3) clean $(REBAR_FLAGS)

dialyzer:
	$(REBAR3) dialyze $(REBAR_FLAGS)

deb:
	cd packaging/deb && $(MAKE) TOPDIR=$(PWD) deb

rpm:
	cd packaging/centos && $(MAKE) TOPDIR=$(PWD) rpm