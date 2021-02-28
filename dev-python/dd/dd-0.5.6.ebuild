# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6,7,8} )
inherit distutils-r1 virtualx

DESCRIPTION="A pure-Python package for manipulating BDDs and MDDs"

HOMEPAGE="https://github.com/tulip-control/dd"

SRC_URI="https://github.com/tulip-control/dd/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="BSD"

SLOT="0"

KEYWORDS="~amd64"

IUSE="cudd sylvan buddy"
REQUIRED_USE="cudd? sylvan? buddy?"

DEPEND="${RDEPEND}
	cudd? (
		>=sci-lib/cudd-3.0.0
	)
	sylvan? (
		>=sci-lib/sylvan-1.4.1
	)
	buddy? (
		>=sci-lib/buddy-2.4-r1
	)
"
