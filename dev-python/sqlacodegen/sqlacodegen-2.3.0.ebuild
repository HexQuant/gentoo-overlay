# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{6..10} )
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
KEYWORDS="~amd64"

DEPEND="
	>=dev-python/sqlalchemy-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/inflect-4.0.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/importlib_metadata[${PYTHON_USEDEP}]' pypy3 python3_{6,7})
	$(python_gen_cond_dep 'dev-python/dataclasses[${PYTHON_USEDEP}]' pypy3 python3_6)
	"

RDEPEND="${DEPEND}"
BDEPEND=""
