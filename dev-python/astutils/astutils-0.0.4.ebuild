# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..7} )
inherit distutils-r1

DESCRIPTION="Bare essentials for building abstract syntax trees, and skeleton classes for PLY lexers and parsers"

HOMEPAGE="https://github.com/johnyf/astutils"
SRC_URI="https://github.com/johnyf/astutils/archive/v${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
