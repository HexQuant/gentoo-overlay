# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6..9} )
inherit distutils-r1 virtualx

DESCRIPTION="A pure-Python package for manipulating BDDs and MDDs"

HOMEPAGE="https://github.com/tulip-control/dd"

SRC_URI="https://github.com/tulip-control/dd/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="BSD"

SLOT="0"

KEYWORDS="~amd64"

IUSE="cudd sylvan buddy"
#REQUIRED_USE="cudd? sylvan? buddy?"
#RESTRICT="!test? ( test )"

DEPEND="${RDEPEND}
	>=dev-python/astutils-0.0.1[${PYTHON_USEDEP}]
	>=dev-python/ply-3.4[${PYTHON_USEDEP}]
	>=dev-python/psutil-3.2.2[${PYTHON_USEDEP}]
	>=dev-python/pydot-1.2.2[${PYTHON_USEDEP}]
	cudd? (
		>=sci-libs/cudd-3
	)
	sylvan? (
		>=sci-libs/sylvan-1.4.1
	)
	buddy? (
		>=sci-libs/buddy-2.4-r1
	)
"
