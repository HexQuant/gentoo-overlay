# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit autotools
DESCRIPTION="The CUDD package is a package for the manipulation of decision diagrams"
HOMEPAGE="http://vlsi.colorado.edu/~fabio/"
SRC_URI="https://github.com/ivmai/cudd/archive/cudd-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
