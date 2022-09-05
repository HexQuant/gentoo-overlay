# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{7..10} )

DESCRIPTION="Analytical Web Apps for Python, R, Julia, and Jupyter."
HOMEPAGE="plotly.com/dash"

inherit distutils-r1

if [[ "${PV}" = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/plotly/dash.git"
else
	SRC_URI="https://github.com/plotly/dash/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"

DEPEND="
	>=dev-python/flask-1.0.4[${PYTHON_USEDEP}]
	dev-python/flask-compress[${PYTHON_USEDEP}]
	>=dev-python/plotly-5.0.0[${PYTHON_USEDEP}]
"
	#>=sci-visualization/dash-html-components-2.0.0[${PYTHON_USEDEP}]
	#>=sci-visualization/dash-core-components-2.0.0[${PYTHON_USEDEP}]
	#>=sci-visualization/dash-table-5.0.0[${PYTHON_USEDEP}]

RDEPEND="${DEPEND}"
BDEPEND=""
