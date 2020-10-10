################################################################################
#
# glog
#
################################################################################

ifeq ($(USING_GLOG_OLD),y)
GLOG_VERSION = 0.4.0
GLOG_SITE = $(call github,google,glog,v$(GLOG_VERSION))
else
GLOG_VERSION = c8f8135a5720aee7de8328b42e4c43f8aa2e60aa
GLOG_SITE = $(call github,google,glog,$(GLOG_VERSION))
endif

GLOG_INSTALL_STAGING = YES
GLOG_LICENSE = BSD-3-Clause
GLOG_LICENSE_FILES = COPYING
GLOG_CONF_OPTS = \
	$(if $(BR2_TOOLCHAIN_HAS_THREADS),-DWITH_THREADS=ON, -DWITH_THREADS=OFF)


define GLOG_OLD_PATCHES
	$(APPLY_PATCHES) $(@D) $(GLOG_PKGDIR)/patch \*.patch
endef

ifeq ($(USING_GLOG_OLD),y)
GLOG_POST_PATCH_HOOKS += GLOG_OLD_PATCHES
endif

ifeq ($(BR2_PACKAGE_GFLAGS),y)
GLOG_DEPENDENCIES = gflags
GLOG_CONF_OPTS += -DWITH_GFLAGS=ON
else
GLOG_CONF_OPTS += -DWITH_GFLAGS=OFF
endif

$(eval $(cmake-package))
