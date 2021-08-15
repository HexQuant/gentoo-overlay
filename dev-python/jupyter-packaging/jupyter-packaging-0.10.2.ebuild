# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{6..9} )

inherit distutils-r1

DESCRIPTION="Tools to help build and install Jupyter Python packages"
HOMEPAGE="https://github.com/jupyter/jupyter-packaging"
SRC_URI="https://github.com/jupyter/jupyter-packaging/archive/${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/tomlkit[${PYTHON_USEDEP}]
	>=dev-python/setuptools-46.4.0[${PYTHON_USEDEP}]
	dev-python/wheel[${PYTHON_USEDEP}]
	dev-python/deprecation[${PYTHON_USEDEP}]
	"
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	default
	mv * ${P}
}

src_prepare() {
	distutils-r1_src_prepare
}

python_compile() {
	distutils-r1_python_compile
}

python_install() {
	distutils-r1_python_install --skip-build
}

python_install_all() {
	distutils-r1_python_install_all
}
