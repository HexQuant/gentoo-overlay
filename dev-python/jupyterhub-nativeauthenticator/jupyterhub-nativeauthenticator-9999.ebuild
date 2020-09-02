# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python3_{7,8} )

inherit distutils-r1 git-r3

DESCRIPTION="A simple authenticator for small-medium size JupyterHub applications"
HOMEPAGE="https://github.com/jupyterhub/nativeauthenticator"
EGIT_REPO_URI="https://github.com/jupyterhub/nativeauthenticator.git"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="-test"

DEPEND="
	>=dev-python/jupyterhub-0.8[${PYTHON_USEDEP}]
	dev-python/bcrypt[${PYTHON_USEDEP}]
	dev-python/onetimepass[${PYTHON_USEDEP}]
	test? (
		dev-python/codecov[${PYTHON_USEDEP}]
		dev-python/flake8[${PYTHON_USEDEP}]
		>=dev-python/notebook-5.7.8[${PYTHON_USEDEP}]
		>=dev-python/pytest-3.7[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)
"
distutils_enable_tests pytest


RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"
