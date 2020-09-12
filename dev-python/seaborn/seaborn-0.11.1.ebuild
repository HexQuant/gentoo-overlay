# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..8})

inherit distutils-r1 virtualx

DESCRIPTION="Statistical data visualization"
HOMEPAGE="https://seaborn.pydata.org"
SRC_URI="https://github.com/mwaskom/seaborn/archive/${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	>=dev-python/matplotlib-2.2[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.15[${PYTHON_USEDEP}]
	>=dev-python/pandas-0.23[${PYTHON_USEDEP}]
	dev-python/patsy[${PYTHON_USEDEP}]
	>=dev-python/statsmodels-0.8.0[${PYTHON_USEDEP}]
	>=sci-libs/scipy-1.0.1[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
	)
"

python_test() {
	cat > matplotlibrc <<- EOF || die
	backend : Agg
	EOF
	virtx nosetests --verbosity=3 || die
}
