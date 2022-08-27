# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..10} )

DESCRIPTION="Object–relational mapping for Riskspectrum PSA model database"
HOMEPAGE="https://github.com/HexQuant/rsdb"

inherit distutils-r1

if [[ "${PV}" = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/HexQuant/rsdb.git"
else
	inherit distutils-r1
	SRC_URI="https://github.com/HexQuant/rsdb/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="LGPL"
SLOT="0"

RDEPEND="
	dev-python/pyodbc[${PYTHON_USEDEP}]
	dev-python/ipaddress[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-1.3[${PYTHON_USEDEP}]
"
BDEPEND=""

