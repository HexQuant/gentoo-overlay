# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6..9} )

DESCRIPTION="Nbconvert as a webservice (rendering ipynb to static HTML)"
HOMEPAGE="https://nbviewer.jupyter.org/"
if [[ "${PV}" = *9999* ]]; then
	inherit distutils-r1 git-r3
	EGIT_REPO_URI="https://github.com/jupyter/nbviewer.git"
else
	inherit distutils-r1
	SRC_URI="https://github.com/jupyter/nbviewer/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi
KEYWORDS="~amd64"

LICENSE="BSD"
SLOT="0"
IUSE="-newrelic"
RDEPEND="
	dev-python/elasticsearch-py[${PYTHON_USEDEP}]
	>=dev-python/ipython-4.0.0[notebook,${PYTHON_USEDEP}]
	dev-python/jupyter_client[${PYTHON_USEDEP}]
	>=dev-python/jupyter_server-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/markdown-3.1.1[${PYTHON_USEDEP}]
	>=dev-python/nbconvert-5.4[${PYTHON_USEDEP}]
	>=dev-python/nbformat-4.2[${PYTHON_USEDEP}]
	newrelic? (	>dev-python/newrelic-2.80.0.60[${PYTHON_USEDEP}] )
	dev-python/pycurl[${PYTHON_USEDEP}]
	dev-python/pylibmc[${PYTHON_USEDEP}]
	dev-python/statsd[${PYTHON_USEDEP}]
	>=www-servers/tornado-6.0[${PYTHON_USEDEP}]
	"
	#<dev-python/nbconvert-6.0.0[${PYTHON_USEDEP}]

DEPEND="${RDEPEND}"
src_prepare() {
	distutils-r1_src_prepare
}

python_compile() {
	distutils-r1_python_compile
}

python_install() {
	distutils-r1_python_install --skip-build
}

python_install_all() {
	distutils-r1_python_install_all
}
