# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
DESCRIPTION="Read RiskSpectrum PSA results bin-files"
HOMEPAGE="https://github.com/HexQuant/rsrfile"

inherit distutils-r1

if [[ "${PV}" = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/HexQuant/rsrfile.git"
else
	SRC_URI="https://github.com/HexQuant/rsrfile/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="LGPL-2.1"
SLOT="0"
DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
