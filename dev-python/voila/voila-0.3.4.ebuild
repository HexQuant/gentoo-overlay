# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{7..10} )

if [[ "${PV}" = *9999* ]]; then
	inherit distutils-r1 git-r3

	EGIT_REPO_URI="https://github.com/voila-dashboards/voila.git"
else
	inherit distutils-r1
	SRC_URI="https://github.com/voila-dashboards/voila/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="Voila turns Jupyter notebooks into standalone web applications"
HOMEPAGE="https://github.com/voila-dashboards/voila"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""

RESTRICT=network-sandbox

DEPEND="
	>=dev-python/jupyter_server-0.3.0[${PYTHON_USEDEP}]
	<dev-python/jupyter_server-2[${PYTHON_USEDEP}]

	>=jupyterlab_server-2.3.0[${PYTHON_USEDEP}]
	<jupyterlab_server-3[${PYTHON_USEDEP}]

	>=dev-python/jupyter_client-6.1.3[${PYTHON_USEDEP}]
	<dev-python/jupyter_client-8[${PYTHON_USEDEP}]

	>=dev-python/nbclient-0.4.0[${PYTHON_USEDEP}]
	<dev-python/nbclient-0.6[${PYTHON_USEDEP}]

	>=dev-python/nbconvert-6.4.2[${PYTHON_USEDEP}]
	<dev-python/nbconvert-7[${PYTHON_USEDEP}]

	>=dev-python/websockets-9.0[${PYTHON_USEDEP}]

	>=dev-python/traitlets-5.0.3[${PYTHON_USEDEP}]
	<dev-python/traitlets-6[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	einfo
	einfo 'Note, allowing network access from the sandbox via RESTRICT=network-sandbox'
	einfo '(needed for building jupyterlab assets via npm)'
	einfo
	distutils-r1_src_prepare
}

#python_compile() {
	#distutils-r1_python_compile
	#mkdir -p assets/lab
	#jupyter lab build --app-dir=${S}/assets/lab --debug
	#jupyter labextension install @voila-dashboards/jupyterlab-preview --app-dir=${S}/assets/lab --debug
	#cd ${S}/assets/lab/staging

#}

#python_install() {
	#mkdir ${D}/usr/share/jupyter/lab -p
	#cp -ar ${S}/assets/lab/* ${D}/usr/share/jupyter/lab/
	#distutils-r1_python_install --skip-build
#}

#python_install_all() {

	#insinto /etc/
	#doins -r etc/.

	#insinto /usr/share/
	#doins -r share/.

#	distutils-r1_python_install_all
#}
