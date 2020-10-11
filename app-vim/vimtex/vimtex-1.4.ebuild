# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7


inherit vim-plugin

DESCRIPTION="vimtex is a modern Vim and neovim filetype plugin for LaTeX files"
HOMEPAGE="https://github.com/lervag/vimtex"
SRC_URI="https://github.com/lervag/vimtex/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=app-editors/vim-8.0.1453
	"
RDEPEND="${DEPEND}"
BDEPEND=""
