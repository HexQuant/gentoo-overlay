# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="JupyterLab Extension to share the URL to a running Jupyter Server"
HOMEPAGE="https://github.com/jupyterlab-contrib/jupyterlab-link-share"

PYTHON_COMPAT=( python3_{6..9} )

if [[ "${PV}" = *9999* ]]; then
	inherit distutils-r1 git-r3

	EGIT_REPO_URI="https://github.com/jupyterlab-contrib/jupyterlab-link-share.git"
else
	inherit distutils-r1
	SRC_URI="https://github.com/jupyterlab-contrib/jupyterlab-link-share/archive/tags/${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	=dev-python/jupyter-packaging-0.10.1[${PYTHON_USEDEP}]
	>=dev-python/jupyterlab-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/setuptools-40.8.0[${PYTHON_USEDEP}]
	dev-python/wheel[${PYTHON_USEDEP}]
	"

RDEPEND="${DEPEND}"
BDEPEND=""
