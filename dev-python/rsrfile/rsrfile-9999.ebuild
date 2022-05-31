# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
DESCRIPTION="Read RiskSpectrum PSA results bin-files"
HOMEPAGE="https://github.com/HexQuant/rsrfile"

if [[ "${PV}" = *9999* ]]; then
	inherit distutils-r1 git-r3
	EGIT_REPO_URI="https://github.com/HexQuant/rsrfile.git"
else
	inherit distutils-r1
	SRC_URI="https://github.com/HexQuant/rsrfile/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS=""
DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
