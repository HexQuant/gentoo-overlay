# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{6..10} )

DESCRIPTION="Python client for the ENTSO-E API"
HOMEPAGE="https://github.com/EnergieID/entsoe-py"
if [[ "${PV}" = *9999* ]]; then
	inherit distutils-r1 git-r3
	EGIT_REPO_URI="https://github.com/EnergieID/entsoe-py.git"
else
	inherit distutils-r1
	SRC_URI="https://github.com/EnergieID/entsoe-py/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

DEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	"

RDEPEND="${DEPEND}"
BDEPEND=""
