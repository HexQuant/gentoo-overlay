# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Sylvan is a parallel (multi-core) MTBDD library written in C"

HOMEPAGE="https://trolando.github.io/sylvan/"

SRC_URI="https://github.com/trolando/sylvan/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"

SLOT="0"

KEYWORDS="~amd64"

IUSE="doc examples test static-libs"

RDEPEND=" "

DEPEND="${RDEPEND}
	doc? ( dev-python/sphinx )
	dev-libs/gmp
	sys-apps/hwloc
"
src_configure() {
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
	if use doc ; then
		cd "${S}/docs"
		emake SPHINXBUILD=sphinx-build html
	fi
}

src_test() {
	cmake-utils_src_test
}


src_install() {
	cmake-utils_src_install
	use doc && dohtml -r "${S}/doc/_build/html/"*

}
