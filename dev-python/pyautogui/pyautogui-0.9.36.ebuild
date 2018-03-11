# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_{5,6,7},3_{1,2,3,4}} )
inherit distutils-r1 virtualx python-utils-r1

DESCRIPTION="GUI automation Python module for human beings"
HOMEPAGE="https://github.com/asweigart/pyautogui"
SRC_URI="mirror://pypi/packages/source/P/PyAutoGUI/PyAutoGUI-0.9.36.tar.gz"

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
