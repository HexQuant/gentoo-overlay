# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )
inherit distutils-r1

DESCRIPTION="NBClassic runs the Jupyter Notebook frontend on the Jupyter Server backend"
HOMEPAGE="https://github.com/jupyterlab/nbclassic"
SRC_URI="https://github.com/jupyterlab/nbclassic/archive/${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=dev-python/jupyter_server-1.8[${PYTHON_USEDEP}]
	dev-python/notebook[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""
