# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..10} )

DESCRIPTION="Python client for the ENTSO-G API"
HOMEPAGE="
	https://github.com/nhcb/entsog-py
"
inherit distutils-r1
if [[ "${PV}" = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/nhcb/entsog-py.git"
else
	SRC_URI="https://github.com/nhcb/entsog-py/archive/V${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	>=dev-python/pandas-1.4.0[${PYTHON_USEDEP}]
	dev-python/unidecode[${PYTHON_USEDEP}]
	"

BDEPEND=""
