# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="VimTeX is a modern Vim and neovim filetype plugin for LaTeX files"
HOMEPAGE="https://github.com/lervag/vimtex"

inherit vim-plugin

if [[ "${PV}" = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/lervag/vimtex.git"
else
	SRC_URI="https://github.com/lervag/vimtex/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"

DEPEND="
	>=app-editors/vim-8.0.1453
	!app-vim/vim-latex
	!app-vim/automatictexplugi
	"
RDEPEND="${DEPEND}"
BDEPEND=""
