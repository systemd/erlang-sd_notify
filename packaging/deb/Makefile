VERSION=1.1

# Directory names
DEB_BUILD_DIR=deb-build
PKG_NAME=erlang-sd-notify
DEB_SOURCE_DIR=$(PKG_NAME)-$(VERSION)

# 
PKG_DEST=$(TOPDIR)/$(DEB_BUILD_DIR)/$(DEB_SOURCE_DIR)

# Where to build the 'pristine' source files
TARBALL_DIR=$(TOPDIR)/$(DEB_BUILD_DIR)
SOURCE_TGZ=$(PKG_NAME)_$(VERSION).orig.tar.gz

# Place to install the compiled files to
TARGET_DIR=$(TARGET_TOP)/usr/lib/erlang/lib/sd_notify-$(VERSION)

deb:
	rm -rf $(PKG_DEST)	
	mkdir -p $(PKG_DEST)
	tar -c -C $(TOPDIR) --exclude-from=$(TOPDIR)/.gitignore --exclude=.git  . | tar -x -C $(PKG_DEST)
	rm $(PKG_DEST)/Makefile
	tar -zcf $(TARBALL_DIR)/$(SOURCE_TGZ) -C $(TARBALL_DIR) $(DEB_SOURCE_DIR)
	tar -c debian | tar -x -C $(PKG_DEST)
	cp $(TOPDIR)/LICENSE $(PKG_DEST)/debian/copyright
	sed -i 's/%VERSION%/$(VERSION)/g' $(PKG_DEST)/debian/$(PKG_NAME).dirs
	cd $(PKG_DEST) && debuild -d -us -uc

deb-install:
	pwd
	install -o root -g root -t $(TARGET_DIR)/ebin ../../ebin/*.app
	install -o root -g root -t $(TARGET_DIR)/ebin ../../ebin/*.beam