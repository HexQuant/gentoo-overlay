# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{6..9} )

if [[ "${PV}" = *9999* ]]; then
	inherit distutils-r1 git-r3
 
    EGIT_REPO_URI="https://github.com//newrelic/newrelic-python-agent.git"
else
    inherit distutils-r1
	SRC_URI="https://github.com//newrelic/newrelic-python-agent/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="New Relic Python Agent"
HOMEPAGE="http://newrelic.com/docs/python/new-relic-for-python"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	dev-python/setuptools_scm[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"

#src_prepare() {
#	distutils-r1_src_prepare
#}

#python_compile() {
#	distutils-r1_python_compile
#}

#python_install() {
#	distutils-r1_python_install --skip-build
#}

#python_install_all() {
#	distutils-r1_python_install_all
#}
