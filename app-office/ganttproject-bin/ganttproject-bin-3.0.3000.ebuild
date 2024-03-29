# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit eutils

REV="r2179"
MY_P=${PN/-bin}-${PV}
DESCRIPTION="Free desktop project scheduling app"
HOMEPAGE="http://ganttproject.sourceforge.net/"
#SRC_URI="https://dl.ganttproject.biz/${MY_P}/${MY_P}-${REV}.zip" 
SRC_URI="https://github.com/bardsoftware/ganttproject/archive/ganttproject-${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-arch/unzip
		>=virtual/jdk-1.7"
RDEPEND="virtual/jre"

S="${WORKDIR}/${MY_P}-${REV}"

src_prepare() {
	default
	rm "${S}/"{ganttproject.command,ganttproject.exe,ganttproject.bat,HouseBuildingSample.gan} || die "rm failed"
}

src_install() {
	insinto /opt/${MY_PN}
	doins -r eclipsito.jar lib/ logging.properties "plugins-${PV}/"
	insopts -m0755
	doins ${PN/-bin}
	dosym "${ED%/}"/opt/"${MY_PN}/"${PN/-bin} /opt/bin/${PN/-bin}
	doicon "${S}/plugins-${PV}/ganttproject/data/resources/icons/ganttproject.png"
	make_desktop_entry ${PN/-bin} "GanttProject" "/opt/bin/${PN/-bin}" "Java;Office;ProjectManagement"
}
