# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{7..11} )
inherit distutils-r1

DESCRIPTION="An ultra fast multiple screenshots module in pure python using ctypes"
HOMEPAGE="https://github.com/BoboTiG/python-mss"

if [[ "${PV}" = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/BoboTiG/python-mss.git"
else
	SRC_URI="https://github.com/BoboTiG/python-mss/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
