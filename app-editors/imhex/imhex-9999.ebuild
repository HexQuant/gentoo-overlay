# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..9} )

CMAKE_BUILD_TYPE="Release"
CMAKE_MAKEFILE_GENERATOR="emake"

inherit git-r3 python-single-r1 cmake

DESCRIPTION="A hex editor for reverse engineers, programmers, and eyesight"
HOMEPAGE="https://github.com/WerWolv/ImHex"
#SRC_URI=""
EGIT_REPO_URI="https://github.com/WerWolv/ImHex.git"


LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
RESTRICT=network-sandbox
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND=""
RDEPEND="${DEPEND}
		${PYTHON_DEPS}
		media-libs/glfw
		sys-apps/file
		dev-cpp/nlohmann_json
		x11-libs/gtk+
		net-libs/mbedtls
		"
BDEPEND="${DEPEND}"

src_configure() {
	mycmakeargs+=(
		-DPYTHON_VERSION_MAJOR_MINOR="\3.9\""
	)
	cmake_src_configure
}
