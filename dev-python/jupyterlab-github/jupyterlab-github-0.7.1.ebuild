# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..8} )

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
	>=dev-python/jupyterlab-0.32[${PYTHON_USEDEP}]
"

