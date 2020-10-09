################################################################################
#
# glog
#
################################################################################

GLOG_NEW_VERSION = c8f8135a5720aee7de8328b42e4c43f8aa2e60aa
GLOG_NEW_SITE = $(call github,google,glog,$(GLOG_VERSION))
GLOG_NEW_INSTALL_STAGING = YES
GLOG_NEW_LICENSE = BSD-3-Clause
GLOG_NEW_LICENSE_FILES = COPYING
GLOG_NEW_CONF_OPTS = \
	$(if $(BR2_TOOLCHAIN_HAS_THREADS),-DWITH_THREADS=ON, -DWITH_THREADS=OFF)

ifeq ($(BR2_PACKAGE_GFLAGS),y)
GLOG_NEW_DEPENDENCIES = gflags
GLOG_NEW_CONF_OPTS += -DWITH_GFLAGS=ON
else
GLOG_NEW_CONF_OPTS += -DWITH_GFLAGS=OFF
endif

$(eval $(cmake-package))
