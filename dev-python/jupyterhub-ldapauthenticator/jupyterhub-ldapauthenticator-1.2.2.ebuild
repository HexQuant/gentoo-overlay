# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..8} )

inherit distutils-r1

DESCRIPTION="Simple LDAP Authenticator Plugin for JupyterHub"
HOMEPAGE="https://github.com/jupyterhub/ldapauthenticator"
SRC_URI="https://github.com/jupyterhub/ldapauthenticator/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""

RDEPEND="
	dev-python/jupyterhub[${PYTHON_USEDEP}]
	dev-python/ldap3[${PYTHON_USEDEP}]
	www-servers/tornado[${PYTHON_USEDEP}]
	dev-python/traitlets[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"

S="${WORKDIR}/ldapauthenticator-${PV}"
