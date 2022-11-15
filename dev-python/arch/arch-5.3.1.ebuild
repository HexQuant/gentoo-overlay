# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{7..10} )
inherit distutils-r1

DESCRIPTION="ARCH models in Python"
HOMEPAGE="https://github.com/bashtage/arch"

if [[ "${PV}" = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/bashtage/arch.git"
else
	SRC_URI="https://github.com/bashtage/arch/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="UoI-NCSA"
SLOT="0"

RDEPEND="
	>=dev-python/numpy-1.17[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.3[${PYTHON_USEDEP}]
	>=dev-python/pandas-1.0[${PYTHON_USEDEP}]
	>=dev-python/statsmodels-0.11[${PYTHON_USEDEP}]
	>=dev-python/property-cached-1.6.4[${PYTHON_USEDEP}]
	>=dev-python/numba-0.49[${PYTHON_USEDEP}]
	>=dev-python/cython-0.29.30[${PYTHON_USEDEP}]
"
BDEPEND=""

distutils_enable_tests pytest
