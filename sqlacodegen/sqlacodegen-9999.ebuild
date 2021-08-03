# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Automatic model code generator for SQLAlchemy"
HOMEPAGE="https://github.com/agronholm/sqlacodegen"

if [[ "${PV}" = *9999* ]]; then
	inherit distutils-r1 git-r3
	EGIT_REPO_URI="https://github.com/agronholm/sqlacodegen.git"
else
	inherit distutils-r1
	SRC_URI="https://github.com/agronholm/sqlacodegen/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-python/sqlalchemy[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
BDEPEND=""
