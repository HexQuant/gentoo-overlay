# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vim-plugin

DESCRIPTION="UltiSnips is the ultimate solution for snippets in Vim"
HOMEPAGE="https://github.com/SirVer/ultisnips"
SRC_URI="https://github.com/SirVer/ultisnips/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=app-editors/vim-7.4[python]
	"
RDEPEND="${DEPEND}"
BDEPEND=""
