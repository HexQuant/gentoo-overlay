# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{7..10} )

DESCRIPTION=""
HOMEPAGE="
	https://pypi.org/project/camelot-py/
"

inherit distutils-r1
if [[ "${PV}" = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/camelot-dev/camelot.git"
else
	SRC_URI="https://github.com/camelot-dev/camelot.git/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi


LICENSE="MIT"
SLOT="0"

RDEPEND="
	>=dev-python/chardet-3.0.4[${PYTHON_USEDEP}]
	>=dev-python/click-6.7[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.13.3[${PYTHON_USEDEP}]
	>=dev-python/openpyxl-2.5.6[${PYTHON_USEDEP}]
	>=dev-python/pandas-0.23.4[${PYTHON_USEDEP}]
	>=dev-python/PyPDF2-1.26.0[${PYTHON_USEDEP}]
	>=dev-python/tavulate-0.8.9[${PYTHON_USEDEP}]
"

BDEPEND="
	test? (
	)
"

distutils_enable_tests pytest
