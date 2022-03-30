# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{7..9} )

DESCRIPTION="One-time password library for HOTP and TOTP passwords"
HOMEPAGE="https://github.com/tadeck/onetimepass"

if [[ "${PV}" = *9999* ]]; then
	inherit distutils-r1 git-r3

	EGIT_REPO_URI="https://github.com/tadeck/onetimepass.git"
else
	inherit distutils-r1
	SRC_URI="https://github.com/tadeck/onetimepass/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-python/six[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
BDEPEND="test? ( dev-python/timecop[${PYTHON_USEDEP}] )"

distutils_enable_tests unittest
