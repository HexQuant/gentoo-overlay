# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )
inherit distutils-r1

DESCRIPTION="A python tool for creating certificate authorities and certificates on the fly."
HOMEPAGE="https://github.com/LLNL/certipy"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="\
	dev-python/jupyterhub[${PYTHON_USEDEP}] \
"
