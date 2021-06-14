# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )

inherit distutils-r1

DESCRIPTION="Statistical data visualization"
HOMEPAGE="https://seaborn.pydata.org"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="statsmodels fastcluster"

RDEPEND="
	>=dev-python/matplotlib-2.2[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.15[${PYTHON_USEDEP}]
	>=dev-python/pandas-0.23[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.0[${PYTHON_USEDEP}]
	statsmodels? (
		dev-python/statsmodels[${PYTHON_USEDEP}]
	)
	fastclusterd? (
		dev-python/fastcluster[${PYTHON_USEDEP}]
	)
"
DEPEND="${RDEPEND}
	test? ( dev-python/nose[${PYTHON_USEDEP}] )
"

distutils_enable_tests pytest

python_test() {
	cat > matplotlibrc <<- EOF || die
	backend : Agg
	EOF
	pytest -vv || die "Tests fail with ${EPYTHON}"
}
