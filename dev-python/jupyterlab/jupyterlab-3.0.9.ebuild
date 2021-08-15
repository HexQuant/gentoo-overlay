# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..8} )

inherit distutils-r1

DESCRIPTION="The JupyterLab notebook server extension"
HOMEPAGE="https://jupyter.org"
SRC_URI="https://github.com/jupyterlab/jupyterlab/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT=network-sandbox

IUSE="+ipympl slurm"

RDEPEND="
	>=dev-python/notebook-4.3.1[${PYTHON_USEDEP}]
	>=dev-python/jinja-2.1[${PYTHON_USEDEP}]
	>=www-servers/tornado-6.1[${PYTHON_USEDEP}]
	>=dev-python/jupyterlab_server-2.3[${PYTHON_USEDEP}]
	>=dev-python/jupyter_server-1.4[${PYTHON_USEDEP}]
	>=dev-python/jupyter_packaging-0.7.3
	>=dev-python/nbclassic-0.2[${PYTHON_USEDEP}]
	ipympl? (
		>=net-libs/nodejs-14
		dev-python/ipympl[${PYTHON_USEDEP}]
	)
	slurm? (
		dev-python/jupyterlab-slurm[${PYTHON_USEDEP}]
	)
"

src_prepare() {
	einfo ""
	einfo "Note, allowing network access from the sandbox via RESTRICT=network-sandbox"
	einfo "(needed for building jupyterlab assets via npm)"
	einfo ""
	distutils-r1_src_prepare
}

python_compile() {
	distutils-r1_python_compile
	mkdir -p assets/lab
	jupyter lab build --app-dir="${S}/assets/lab" --debug
	jupyter labextension install @jupyter-widgets/jupyterlab-manager jupyter-datawidgets --app-dir="${S}/assets/lab" --debug
	if use ipympl; then
		jupyter labextension install @jupyter-widgets/jupyterlab-manager jupyter-matplotlib --app-dir="${S}/assets/lab" --debug
	fi
	if use slurm; then
		jupyter labextension install @jupyter-widgets/jupyterlab-manager jupyterlab-slurm --app-dir="${S}/assets/lab" --debug
	fi
	cd "${S}/assets/lab/staging"
}

python_install() {
	mkdir "${D}/usr/share/jupyter/lab" -p
	cp -ar "${S}/assets/lab/*" "${D}/usr/share/jupyter/lab/"
	distutils-r1_python_install --skip-build
}

python_install_all() {
	distutils-r1_python_install_all
}
