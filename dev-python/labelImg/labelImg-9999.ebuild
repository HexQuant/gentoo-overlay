# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )

DESCRIPTION="LabelImg is a graphical image annotation tool"
HOMEPAGE="https://github.com/tzutalin/labelImg"

if [[ "${PV}" = *9999* ]]; then
	inherit distutils-r1 git-r3
	EGIT_REPO_URI="https://github.com/tzutalin/labelImg.git"
else
	inherit distutils-r1
	SRC_URI="https://github.com/tzutalin/labelImg/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	>=dev-python/PyQt5-5.14.1[${PYTHON_USEDEP}]
	>=dev-python/lxml-4.6.5[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
BDEPEND=""
src_prepare() {
	emake qt5
	mv resources.py libs/resources.py
	distutils-r1_src_prepare
}
