################################################################################
#
# python-pandas
#
################################################################################

PYTHON_PANDAS_VERSION = 1.1.0
PYTHON_PANDAS_SOURCE = pandas-$(PYTHON_PANDAS_VERSION).tar.gz
PYTHON_PANDAS_SITE = https://files.pythonhosted.org/packages/6f/29/32ff85413724ffa7cc8d52373f93c2ef1cb197ffd0c7b1b10d36452dd0ca
PYTHON_PANDAS_LICENSE = MIT
PYTHON_PANDAS_SETUP_TYPE = setuptools
PYTHON_PANDAS_DEPENDENCIES = host-python-numpy
PYTHON_PANDAS_LICENSE_FILES = LICENSE



$(eval $(python-package))
