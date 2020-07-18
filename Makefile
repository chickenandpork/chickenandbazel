ifeq ($(WORKDIR),)
  WORKDIR=.
endif

DISTRIB=$(WORKDIR)/.distrib
SCRIPTS=$(WORKDIR)/.scripts
STAGE=$(WORKDIR)/.stage


VER_BAZELISK=1.5.0
SHA_BAZELISK=92567ee340797fff5d833e627083787a276c9d2b
URL_BAZELISK="https://github.com/bazelbuild/bazelisk/releases/download/v$(VER_BAZELISK)/bazelisk-darwin-amd64"

VER_IBAZEL=0.13.1
SHA_IBAZEL=92567ee340797fff5d833e627083787a276c9d2b
URL_IBAZEL="https://github.com/bazelbuild/bazel-watcher/releases/download/v$(VER_IBAZEL)/ibazel_darwin_amd64"

PKG_UPPERNAME=ChickenAndBazel
PKG_NAME=chickenandbazel
BINDIR=Applications/$(PKG_UPPERNAME)/bin
PLIST=$(WORKDIR)/$(PKG_UPPERNAME).plist

ifeq ($(DESTDIR),)
  DESTDIR=.
endif

$(DESTDIR)/$(PKG_UPPERNAME)-$(VER_BAZELISK).pkg: $(STAGE)/$(BINDIR)/bazel $(STAGE)/$(BINDIR)/ibazel $(PLIST) $(SCRIPTS)/postinstall
	@mkdir -p $(@D)
	pkgbuild --identifier nu.old.$(PKG_NAME) --component-plist $(PLIST) --scripts $(SCRIPTS) --version $(VER_BAZELISK) --root $(STAGE) $@

$(STAGE)/$(BINDIR)/bazel: $(DISTRIB)/bazelisk-$(VER_BAZELISK)
	@mkdir -p $(@D)
	install -m 0755 $< $@

$(STAGE)/$(BINDIR)/ibazel: $(DISTRIB)/ibazel-$(VER_IBAZEL)
	@mkdir -p $(@D)
	install -m 0755 $< $@

$(DISTRIB)/bazelisk-$(VER_BAZELISK): $(FILE_THAT_NEVER_CHANGES)
	@mkdir -p $(@D)
	curl -Lo $@ $(URL_BAZELISK) && touch $@

$(DISTRIB)/ibazel-$(VER_IBAZEL): $(FILE_THAT_NEVER_CHANGES)
	@mkdir -p $(@D)
	curl -Lo $@ $(URL_IBAZEL) && touch $@


# "generated" in here rather than as static files in the version-control only to keep things in the
# same place and relatively simple.  Sure, it's a bit overreaching the purpose of a Makefile, but
# it works while the objectives are so straight-forward.

$(SCRIPTS)/postinstall: $(MAKEFILES)
	@mkdir -p $(@D)
	rm -f $@
	echo '#!/bin/bash' >> $@
	echo 'ln -sf /$(BINDIR)/bazel /usr/local/bin/bazel' >> $@
	echo 'ln -sf /$(BINDIR)/ibazel /usr/local/bin/ibazel' >> $@
	echo 'exit 0' >> $@
	chmod a+x $@
