# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{6..8} )
inherit distutils-r1 git-r3

DESCRIPTION="GUI automation Python module for human beings"
HOMEPAGE="https://github.com/asweigart/pyautogui"
EGIT_REPO_URI="https://github.com/jasweigart/pyautogui.git"
SLOT="0"
LICENSE="BSD"
KEYWORDS=""
IUSE=""

RDEPEND="
	dev-python/python-xlib[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}
	dev-python/nose[${PYTHON_USEDEP}]
"
