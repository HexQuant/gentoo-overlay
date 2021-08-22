# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{6..9} )
DESCRIPTION="DB API Module for ODBC"
HOMEPAGE="https://github.com/mkleehammer/pyodbc"

if [[ "${PV}" = *9999* ]]; then
	inherit distutils-r1 git-r3
	EGIT_REPO_URI="https://github.com/mkleehammer/pyodbc.git"
else
	inherit distutils-r1
	SRC_URI="https://github.com/mkleehammer/pyodbc/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi
LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="mssql"

DEPEND="
	>=dev-db/unixODBC-2.3.9
	mssql? ( >=dev-db/freetds-0.91[odbc] )
	"
RDEPEND="${DEPEND}"
BDEPEND=""
