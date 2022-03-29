# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{7..10} )

DESCRIPTION="Fast hierarchical clustering routines for R and Python."
HOMEPAGE="http://danifold.net/fastcluster.html"

if [[ "${PV}" = *9999* ]]; then
	inherit distutils-r1 git-r3

	EGIT_REPO_URI="https://github.com/dmuellner/fastcluster.git"
else
	inherit distutils-r1
	SRC_URI="https://github.com/dmuellner/fastcluster/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="BSD GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="test"
#RESTRICT="!test? ( test )"

DEPEND="
	>=dev-python/numpy-1.9[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND="
	test? ( >=dev-python/scipy-1.6.3[${PYTHON_USEDEP}] )
	"
