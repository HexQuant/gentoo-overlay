# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{6..10} )
inherit distutils-r1

DESCRIPTION="
A lunar calendar converter, including a number of lunar and solar holidays, mainly from China.
"
HOMEPAGE="https://pypi.org/project/LunarCalendar/"

if [[ "${PV}" = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/wolfhong/LunarCalendar.git"
else
	#SRC_URI="https://github.com/wolfhong/LunarCalendar/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND="
	>=dev-python/python-dateutil-2.6.1[${PYTHON_USEDEP}]
	>=sci-astronomy/pyephem-3.7.5.3[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
"

BDEPEND=${RDEPEND}

distutils_enable_tests pytest
