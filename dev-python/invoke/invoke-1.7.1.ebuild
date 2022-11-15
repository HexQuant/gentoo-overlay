# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{7..10} )
inherit distutils-r1

DESCRIPTION="Pythonic task execution"
HOMEPAGE="https://www.pyinvoke.org/"

if [[ "${PV}" = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/pyinvoke/invoke.git"
else
	SRC_URI="https://github.com/pyinvoke/invoke/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="BSD-2"
SLOT="0"

RDEPEND=""
BDEPEND=""
src_prepare(){
	rm -r ./invoke/vendor/yaml2
	eapply_user
}
