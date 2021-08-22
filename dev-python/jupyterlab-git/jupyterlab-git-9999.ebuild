# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{6..9} )

inherit distutils-r1

DESCRIPTION="A JupyterLab extension for version control using Git"
HOMEPAGE="https://github.com/jupyterlab/jupyterlab-git"

if [[ "${PV}" = *9999* ]]; then
	inherit distutils-r1 git-r3
	EGIT_REPO_URI="https://github.com/jupyterlab/jupyterlab-git.git"
else
	inherit distutils-r1
	SRC_URI="https://github.com/jupyterlab/jupyterlab-git/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
	dev-python/notebook[${PYTHON_USEDEP}]
	>=dev-python/jupyterlab-3.0[${PYTHON_USEDEP}]
	>=dev-python/nbdime-3.1.0[${PYTHON_USEDEP}]
	dev-python/nbformat[${PYTHON_USEDEP}]
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
