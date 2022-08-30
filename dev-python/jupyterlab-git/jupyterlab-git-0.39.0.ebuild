# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{6..10} )

DESCRIPTION="A JupyterLab extension for version control using Git"
HOMEPAGE="https://github.com/jupyterlab/jupyterlab-git"

inherit distutils-r1

if [[ "${PV}" = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/jupyterlab/jupyterlab-git.git"
else
	SRC_URI="https://github.com/jupyterlab/jupyterlab-git/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND="
	dev-python/jupyter_server[${PYTHON_USEDEP}]
	>=dev-python/jupyterlab-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/nbdime-3.1.0[${PYTHON_USEDEP}]
	dev-python/nbformat[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/pexpect[${PYTHON_USEDEP}]
	>=dev-vcs/git-2
	>=dev-python/traitlets-5.0[${PYTHON_USEDEP}]
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
