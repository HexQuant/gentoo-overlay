# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{7..10} )

DESCRIPTION="The library of Bootstrap components for Plotly Dash"
HOMEPAGE="https://dash-bootstrap-components.opensource.faculty.ai/"

inherit distutils-r1
if [[ "${PV}" = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/facultyai/dash-bootstrap-components.git"
else
	SRC_URI="https://github.com/facultyai/dash-bootstrap-components/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="Apache-2.0"
SLOT="0"

DEPEND="
	>=sci-visualization/dash-2.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-python/semver[${PYTHON_USEDEP}]
"

src_compile() {
	invoke build-py
	default_src_compile
}

