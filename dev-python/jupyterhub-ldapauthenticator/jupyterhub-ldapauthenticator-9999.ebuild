# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{7..9} )

DESCRIPTION="Simple LDAP Authenticator Plugin for JupyterHub"
HOMEPAGE="https://github.com/jupyterhub/ldapauthenticator"

if [[ "${PV}" = *9999* ]]; then
	inherit distutils-r1 git-r3
	EGIT_REPO_URI="https://github.com/jupyterhub/ldapauthenticator.git"
else
	inherit distutils-r1
	SRC_URI="https://github.com/jupyterhub/ldapauthenticator/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="BSD"
SLOT="0"
KEYWORDS=""

IUSE=""

RDEPEND="
	dev-python/jupyterhub[${PYTHON_USEDEP}]
	dev-python/ldap3[${PYTHON_USEDEP}]
	www-servers/tornado[${PYTHON_USEDEP}]
	dev-python/traitlets[${PYTHON_USEDEP}]
"

BDEPEND="${RDEPEND}"

S="${WORKDIR}/ldapauthenticator-${PV}"
