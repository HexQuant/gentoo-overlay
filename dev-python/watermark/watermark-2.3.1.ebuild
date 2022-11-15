# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )
inherit distutils-r1

DESCRIPTION="IPython magic function to print date/time stamps and various system information."
HOMEPAGE="
	https://github.com/rasbt/watermark
"
if [[ "${PV}" = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/rasbt/watermark.git"
else
	SRC_URI="https://github.com/rasbt/watermark/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="BSD"
SLOT="0"

DEPEND="
	dev-python/ipython[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""

distutils_enable_tests pytest
