# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{6..9} )

DESCRIPTION="A JupyterLab extension for accessing GitHub repositories"
HOMEPAGE="https://github.com/jupyterlab/jupyterlab-github"

if [[ "${PV}" = *9999* ]]; then
	inherit distutils-r1 git-r3
	EGIT_REPO_URI="https://github.com/jupyterlab/jupyterlab-github"
else
	inherit distutils-r1
	SRC_URI="https://github.com/jupyterlab/jupyterlab-github/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi


LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
	>=dev-python/jupyterlab-3.0.0[${PYTHON_USEDEP}]
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
	jupyter server extension enable jupyterlab_github
}
