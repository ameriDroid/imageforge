PROJECT ?= imageforge
PREFIX ?= /usr
BINDIR ?= $(PREFIX)/bin
LIBDIR ?= $(PREFIX)/lib
MANDIR ?= $(PREFIX)/share/man
ETCDIR ?= /etc

.PHONY: all
all: build

.PHONY: build
build: 
	./build.sh

#
# Test
#
.PHONY: test
test:

#
# Clean
#
.PHONY: distclean
distclean: clean

.PHONY: clean
clean: clean-deb


.PHONY: clean-deb
clean-deb:
	rm -rf debian/.debhelper debian/imageforge/ debian/debhelper-build-stamp debian/files debian/*.debhelper.log debian/*.postrm.debhelper debian/*.substvars

.PHONY: deb
deb: debian
	debuild --no-lintian --no-sign -b -d
