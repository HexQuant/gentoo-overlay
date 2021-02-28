# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..8} )

inherit distutils-r1

DESCRIPTION="A set of server components for JupyterLab and JupyterLab like applications"
HOMEPAGE="https://jupyter.org"
SRC_URI="https://github.com/jupyterlab/jupyterlab_server/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/json5[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-3.0.1[${PYTHON_USEDEP}]
	>=dev-python/jinja-2.10[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	>=dev-python/notebook-4.2.0[${PYTHON_USEDEP}]
	>=dev-python/jupyter_server-1.4[${PYTHON_USEDEP}]
	>=dev-vcs/git-1.4.7
"
