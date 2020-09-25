# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..8} )
inherit distutils-r1

DESCRIPTION="LabelImg is a graphical image annotation tool"
HOMEPAGE="https://github.com/tzutalin/labelImg"
SRC_URI="https://github.com/tzutalin/labelImg/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-python/PyQt5-5.10.1[${PYTHON_USEDEP}]
	>=dev-python/lxml-4.2.4[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
BDEPEND=""
src_prepare() {
	emake qt5
	mv resources.py libs/resources.py
	distutils-r1_src_prepare
}
