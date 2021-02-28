# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..8} )

inherit distutils-r1

DESCRIPTION="A JupyterLab extension for version control using Git"
HOMEPAGE="https://github.com/jupyterlab/jupyterlab-git"
SRC_URI="https://github.com/jupyterlab/jupyterlab-git/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	dev-python/notebook[${PYTHON_USEDEP}]
	>=dev-python/jupyterlab-2.0[${PYTHON_USEDEP}]
	>=dev-python/nbdime-2.0.0[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/pexpect[${PYTHON_USEDEP}]
	>=dev-vcs/git-2
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
	jupyter serverextension enable --py jupyterlab_git
	jupyter labextension install @jupyterlab/git

}
