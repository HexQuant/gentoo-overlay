# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{6..9} )

DESCRIPTION="Matplotlib Jupyter Integration"
HOMEPAGE="https://github.com/matplotlib/ipympl"

if [[ "${PV}" = *9999* ]]; then
	inherit distutils-r1 git-r3

	EGIT_REPO_URI="https://github.com/matplotlib/ipympl"
else
	inherit distutils-r1
	SRC_URI="https://github.com/matplotlib/ipympl/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="network-sandbox"

DEPEND="
	dev-python/jupyter-packaging[${PYTHON_USEDEP}]
	>=dev-python/ipykernel-4.7[${PYTHON_USEDEP}]
	>=dev-python/ipywidgets-7.6.0[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-2.0.0[${PYTHON_USEDEP}]
	sys-apps/yarn
"
RDEPEND="${DEPEND}"
BDEPEND=""
