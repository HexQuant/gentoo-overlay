# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{6..9} )

inherit distutils-r1

DESCRIPTION="Library to fill the void in Python's time series analysis capabilities"
HOMEPAGE="http://alkaline-ml.com/pmdarima/"
if [[ "${PV}" = *9999* ]]; then
	inherit distutils-r1 git-r3
	EGIT_REPO_URI="https://github.com/alkaline-ml/pmdarima.git"
else
	inherit distutils-r1
	SRC_URI="https://github.com/alkaline-ml/pmdarima/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=dev-python/joblib-0.11[${PYTHON_USEDEP}]
	>=dev-python/cython-0.29[${PYTHON_USEDEP}]
	!=dev-python/cython-0.29.18[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.19.3[${PYTHON_USEDEP}]
	>=dev-python/pandas-0.19[${PYTHON_USEDEP}]
	>=sci-libs/scikit-learn-0.22[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.3.2[${PYTHON_USEDEP}]
	>=dev-python/statsmodels-0.11[${PYTHON_USEDEP}]
	!=dev-python/statsmodels-0.12.0[${PYTHON_USEDEP}]
	dev-python/urllib3[${PYTHON_USEDEP}]
	"
RDEPEND="${DEPEND}"
BDEPEND=""
