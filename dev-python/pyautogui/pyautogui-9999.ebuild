# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )
inherit distutils-r1 git-r3  virtualx python-utils-r1

DESCRIPTION="GUI automation Python module for human beings"
HOMEPAGE="https://github.com/asweigart/pyautogui"
SRC_URI=""
EGIT_REPO_URI="https://github.com/asweigart/pyautogui.git"

SLOT="0"
LICENSE="BSD"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND="
	dev-python/python-xlib[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}
	dev-python/nose[${PYTHON_USEDEP}]
"
