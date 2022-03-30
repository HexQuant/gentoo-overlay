# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

#The package does not officially support python 3.7 or higher
PYTHON_COMPAT=( python3_{6..9} )
inherit distutils-r1

DESCRIPTION="Utilities for abstract syntax trees and parsing with PLY"

HOMEPAGE="https://github.com/johnyf/astutils"
SRC_URI="https://github.com/johnyf/astutils/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
