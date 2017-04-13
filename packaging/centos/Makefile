FINAL_OUTPUT_DIR=FINAL_RPMS



VERSION=1.0

# Directory names
RPM_BUILD_DIR=rpm-build
PKG_NAME=erlang-sd_notify
RPM_SOURCE_DIR=$(PKG_NAME)-$(VERSION)

TOP_DIR=$(shell pwd)

TARBALL_DIR=$(TOPDIR)
SOURCE_TGZ=$(PKG_NAME)-$(VERSION).tar.gz
TARGET_DIR=$(TARGET_TOP)/usr/lib/erlang/lib/sd_notify-$(VERSION)


DEFINES=--define '_topdir $(TOP_DIR)' --define '_tmppath $(TOP_DIR)/tmp' --define '_sysconfdir /etc' --define '_localstatedir /var'

rpm:	clean erlang-sd_notify

prepare:
	mkdir -p BUILD SOURCES SPECS SRPMS RPMS tmp dist $(TARBALL_DIR)
	tar czf $(TARBALL_DIR)/$(SOURCE_TGZ)  -C $(TOPDIR)  src/ c_src/ rebar.config LICENSE
	cp $(TOPDIR)/$(SOURCE_TGZ) SOURCES
	rm $(TOPDIR)/$(SOURCE_TGZ)
	cp erlang-sd_notify.spec SPECS

erlang-sd_notify: prepare
	mkdir -p $(FINAL_OUTPUT_DIR)
	rpmbuild -vvv -bb --nodeps SPECS/erlang-sd_notify.spec $(DEFINES)
	find RPMS -name "*.rpm" -exec sh -c 'mv {} `echo {} | sed 's#^RPMS\/noarch#$(FINAL_OUTPUT_DIR)#'`' ';'

clean:
	rm -rf BUILDROOT BUILD SOURCES SPECS SRPMS RPMS tmp $(FINAL_OUTPUT_DIR) dist
