# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..10} )

DESCRIPTION="Python client for the ENTSO-E API"
HOMEPAGE="https://github.com/EnergieID/entsoe-py"

inherit distutils-r1

if [[ "${PV}" = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/EnergieID/entsoe-py.git"
else
	SRC_URI="https://github.com/EnergieID/entsoe-py/archive/V${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"

DEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	>=dev-python/pandas-1.4.0[${PYTHON_USEDEP}]
	"

RDEPEND="${DEPEND}"
BDEPEND=""
