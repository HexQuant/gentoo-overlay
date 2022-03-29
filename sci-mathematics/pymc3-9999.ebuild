# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Bayesian Modeling and Probabilistic Machine Learning in Python"
HOMEPAGE="https://github.com/pymc-devs/pymc"

if [[ "${PV}" = *9999* ]]; then
	inherit distutils-r1 git-r3
	EGIT_REPO_URI="https://github.com/pymc-devs/pymc.git"
else
	inherit distutils-r1
	SRC_URI="https://github.com/pymc-devs/pymc/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="AFL-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=dev-python/aeppl-0.0.18[${PYTHON_USEDEP}]
	>=dev-python/aesara-2.3.8[${PYTHON_USEDEP}]
	>=dev-python/arviz-0.11.4[${PYTHON_USEDEP}]
	>=dev-python/cachetools-4.2.1[${PYTHON_USEDEP}]
	dev-python/cloudpickle[${PYTHON_USEDEP}]
	>=dev-python/fastprogress-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.15.0[${PYTHON_USEDEP}]
	>=dev-python/pandas-0.24.0[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.4.1[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-3.7.4[${PYTHON_USEDEP}]
	"
RDEPEND="${DEPEND}"
BDEPEND=""
