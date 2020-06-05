# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8})

inherit distutils-r1 git-r3 virtualx

DESCRIPTION="Statistical data visualization"
HOMEPAGE="http://stanford.edu/~mwaskom/software/seaborn/ https://github.com/mwaskom/seaborn"
SRC_URI=""
EGIT_REPO_URI="https://github.com/mwaskom/seaborn.git"


SLOT="0"
LICENSE="BSD"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND="
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	dev-python/patsy[${PYTHON_USEDEP}]
	dev-python/statsmodels[${PYTHON_USEDEP}]
	sci-libs/scipy[${PYTHON_USEDEP}]
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
