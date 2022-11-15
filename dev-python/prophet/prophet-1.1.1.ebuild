# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools

PYTHON_COMPAT=( python3_{7..10} )
inherit distutils-r1

DESCRIPTION="Prophet is a forecasting procedure implemented in Python"
HOMEPAGE="https://facebook.github.io/prophet/"

if [[ "${PV}" = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/facebook/prophet.git"
else
	SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"
	#SRC_URI="https://github.com/facebook/prophet/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

S="${WORKDIR}/${P}/python"
RESTRICT=network-sandbox

LICENSE="MIT"
SLOT="0"

RDEPEND="

	>=dev-python/cmdstanpy-1.0.4[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.15.4[${PYTHON_USEDEP}]
	>=dev-python/pandas-1.0.4[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/LunarCalendar-0.0.9[${PYTHON_USEDEP}]
	>=dev-python/convertdate-2.1.2[${PYTHON_USEDEP}]
	>=dev-python/holidays-0.14.2[${PYTHON_USEDEP}]
	>=dev-python/setuptools-42[${PYTHON_USEDEP}]
	>=dev-python/setuptools-git-1.2[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.8.0[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.36.1[${PYTHON_USEDEP}]
	>=dev-python/wheel-0.37[${PYTHON_USEDEP}]
"
BDEPEND=${RDEPEND}

distutils_enable_tests pytest
