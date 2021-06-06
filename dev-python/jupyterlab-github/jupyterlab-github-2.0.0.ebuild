# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )

inherit distutils-r1

DESCRIPTION="A JupyterLab extension for accessing GitHub repositories"
HOMEPAGE="https://github.com/jupyterlab/jupyterlab-github"
SRC_URI="https://github.com/jupyterlab/jupyterlab-github/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	dev-python/notebook[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"

src_prepare() {
	einfo
	einfo 'Note, allowing network access from the sandbox via RESTRICT=network-sandbox'
	einfo '(needed for building jupyterlab assets via npm)'
	einfo
	distutils-r1_src_prepare
}

python_compile() {
	distutils-r1_python_compile
	jupyter serverextension enable --py jupyterlab_github
	jupyter labextension install @jupyterlab/github
}
