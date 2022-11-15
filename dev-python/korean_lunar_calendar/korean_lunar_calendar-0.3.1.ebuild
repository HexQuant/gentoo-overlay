# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{6..10} )
inherit distutils-r1

DESCRIPTION="
Libraries to convert Korean lunar-calendar to Gregorian calendar written in python
"
HOMEPAGE="
https://github.com/usingsky/korean_lunar_calendar_py
"
if [[ "${PV}" = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/usingsky/korean_lunar_calendar_py.git"
else
	SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND=""
BDEPEND=""

distutils_enable_tests pytest
