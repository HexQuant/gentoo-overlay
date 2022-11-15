# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="A decorator for caching properties in classes (forked from cached-property)"
HOMEPAGE="https://github.com/althonos/property-cached/"

if [[ "${PV}" = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/althonos/property-cached.git"
else
	SRC_URI="https://github.com/althonos/property-cached/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="BSD"
SLOT="0"

RDEPEND=""
BDEPEND=""
