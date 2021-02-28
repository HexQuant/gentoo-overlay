# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..8} )

inherit distutils-r1

DESCRIPTION="Tools to help build and install Jupyter Python packages"
HOMEPAGE="https://github.com/jupyter/jupyter-packaging"
SRC_URI="https://github.com/jupyter/jupyter-packaging/archive/${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
