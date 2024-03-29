# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )

DESCRIPTION="Statistical data visualization"
HOMEPAGE="https://seaborn.pydata.org"

inherit distutils-r1

if [[ "${PV}" = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/mwaskom/seaborn.git"
else
	SRC_URI="https://github.com/mwaskom/seaborn/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="BSD"
SLOT="0"
IUSE="+stats +fastcluster"

RDEPEND="
	>=dev-python/matplotlib-3.1[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.17[${PYTHON_USEDEP}]
	>=dev-python/pandas-0.25[${PYTHON_USEDEP}]
	stats? (
		>=dev-python/statsmodels-0.10[${PYTHON_USEDEP}]
		>=dev-python/scipy-1.3[${PYTHON_USEDEP}]
	)
	fastcluster? (
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
	epytest
	#pytest -vv || die "Tests fail with ${EPYTHON}"
}
