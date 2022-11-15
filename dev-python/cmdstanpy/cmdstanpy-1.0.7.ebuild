# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{7..10} )
inherit distutils-r1

DESCRIPTION="The lightweight interface to Stan for Python"
HOMEPAGE="https://mc-stan.org/support/"

if [[ "${PV}" = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/stan-dev/cmdstanpy.git"
else
	SRC_URI="https://github.com/stan-dev/cmdstanpy/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="BSD"
SLOT="0"

RDEPEND="
	dev-python/pandas[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.21.0[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	dev-python/ujson[${PYTHON_USEDEP}]

"
BDEPEND="
	test? (
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/xarray[${PYTHON_USEDEP}]
		dev-python/mypy[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
