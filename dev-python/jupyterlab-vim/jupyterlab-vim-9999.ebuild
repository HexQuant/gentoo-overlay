# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{6..10} )

DESCRIPTION="Notebook cell vim bindings"
HOMEPAGE="https://github.com/axelfahy/jupyterlab-vim"

if [[ "${PV}" = *9999* ]]; then
	inherit distutils-r1 git-r3
	EGIT_REPO_URI="https://github.com/axelfahy/jupyterlab-vim.git"
else
	inherit distutils-r1
	SRC_URI="https://github.com/axelfahy/jupyterlab-vim/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

DEPEND="
	>=dev-python/jupyterlab-3.0[${PYTHON_USEDEP}]
	>=dev-python/jupyter_packaging-0.9[${PYTHON_USEDEP}]
	<dev-python/jupyter_packaging-2[${PYTHON_USEDEP}]
	"
RDEPEND="${DEPEND}"
BDEPEND=""

python_compile() {
	distutils-r1_python_compile
	jupyter serverextension enable jupyterlab_vim
}
