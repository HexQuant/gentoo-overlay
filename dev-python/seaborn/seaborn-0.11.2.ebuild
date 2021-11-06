# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{7..9} )

DESCRIPTION="Statistical data visualization"
HOMEPAGE="https://seaborn.pydata.org"

if [[ "${PV}" = *9999* ]]; then
	inherit distutils-r1 git-r3
	EGIT_REPO_URI="https://github.com/mwaskom/seaborn.git"
else
	inherit distutils-r1
	SRC_URI="https://github.com/mwaskom/seaborn/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+statsmodels +fastcluster"

RDEPEND="
	>=dev-python/matplotlib-3.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.16[${PYTHON_USEDEP}]
	>=dev-python/pandas-0.24[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.2[${PYTHON_USEDEP}]
	statsmodels? (
		>=dev-python/statsmodels-0.9[${PYTHON_USEDEP}]
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
	pytest -vv || die "Tests fail with ${EPYTHON}"
}
