################################################################################
#
# python-peewee
#
################################################################################

PYTHON_PEEWEE_VERSION = 3.13.3
PYTHON_PEEWEE_SOURCE = peewee-$(PYTHON_PEEWEE_VERSION).tar.gz
PYTHON_PEEWEE_SITE = https://files.pythonhosted.org/packages/e1/3e/a21e7268fa39756cdbd6d86af78ff1c0a92b84d6dbfadff431e9e3b9e1d3
PYTHON_PEEWEE_LICENSE = MIT
PYTHON_PEEWEE_SETUP_TYPE = setuptools
PYTHON_PEEWEE_LICENSE_FILES = LICENSE


$(eval $(python-package))
