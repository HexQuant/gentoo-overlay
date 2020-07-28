# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8})

inherit distutils-r1 virtualx

DESCRIPTION="Statistical data visualization"
HOMEPAGE="https://seaborn.pydata.org"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

SLOT="0"
LICENSE="BSD"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND="
	>=dev-python/matplotlib-2.2.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.15.0[${PYTHON_USEDEP}]
	>=dev-python/pandas-0.23.0[${PYTHON_USEDEP}]
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
