# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..9} )

CMAKE_BUILD_TYPE="Release"
CMAKE_MAKEFILE_GENERATOR="emake"

inherit cmake python-single-r1 git-r3

DESCRIPTION="A hex editor for reverse engineers, programmers, and eyesight"
HOMEPAGE="https://github.com/WerWolv/ImHex"
SRC_URI="https://github.com/WerWolv/ImHex/archive/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/ImHex-${PV}"

EGIT_REPO_URI="https://github.com/WerWolv/ImHex.git"
EGIT_SUBMODULES=(
	external/nativefiledialog
	external/yara/yara
	external/xdgpp
	external/fmt
	external/curl
)
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

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	python-single-r1_pkg_setup
	local mycmakeargs=(
		-DPROJECT_VERSION="${PV}"
		-DPYTHON_VERSION_MAJOR_MINOR="\"${EPYTHON/python/}\""
		-DUSE_SYSTEM_CURL=ON
		-DUSE_SYSTEM_FMT=ON
		-DUSE_SYSTEM_LLVM=ON
		-DUSE_SYSTEM_NLOHMANN_JSON=ON
		-DUSE_SYSTEM_YARA=ON
	)
	cmake_src_configure
}
