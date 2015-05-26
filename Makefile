OPENRESTY_PREFIX=/usr/local/openresty
PREFIX ?= /usr/local
LUA_INCLUDE_DIR ?= $(PREFIX)/include
LUA_LIB_DIR ?= $(PREFIX)/lib/lua/$(LUA_VERSION)
INSTALL ?= install
LUA_TREE = $(PREFIX)/lib
VIRTUALENV = virtualenv-2.7

.PHONY: install build test

all: ;

install: 
	luarocks make
	luarocks install JSON4Lua


export PATH := ./lib:$(PATH)

bin/nosetests:
	$(VIRTUALENV) --no-site-packages .
	bin/pip install git+git://github.com/tarekziade/NginxTest
	bin/pip install nose
	bin/pip install webtest
	bin/pip install WSGIProxy2

test: bin/nosetests
	export PATH
	bin/nosetests -sv tests
