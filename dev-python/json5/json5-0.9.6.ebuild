# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..9} )

DESCRIPTION="A Python implementation of the JSON5 data format"
HOMEPAGE="https://github.com/dpranke/pyjson5"

if [[ "${PV}" = *9999* ]]; then
	inherit distutils-r1 git-r3
	EGIT_REPO_URI="https://github.com/dpranke/pyjson5.git"
else
	inherit distutils-r1
	SRC_URI="https://github.com/dpranke/pyjson5/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
