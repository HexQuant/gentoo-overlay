# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{7..9} )

DESCRIPTION="A simple authenticator for small-medium size JupyterHub applications"
HOMEPAGE="https://github.com/jupyterhub/nativeauthenticator"

if [[ "${PV}" = *9999* ]]; then
	inherit distutils-r1 git-r3

	EGIT_REPO_URI="https://github.com/jupyterhub/nativeauthenticator.git"
else
	inherit distutils-r1
	SRC_URI="https://github.com/jupyterhub/nativeauthenticator/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="-test"

DEPEND="
	>=dev-python/jupyterhub-1.3[${PYTHON_USEDEP}]
	dev-python/bcrypt[${PYTHON_USEDEP}]
	dev-python/onetimepass[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND="
	test? (
		dev-python/codecov[${PYTHON_USEDEP}]
		dev-python/flake8[${PYTHON_USEDEP}]
		>=dev-python/notebook-6.1.5[${PYTHON_USEDEP}]
		>=dev-python/pytest-3.7[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

