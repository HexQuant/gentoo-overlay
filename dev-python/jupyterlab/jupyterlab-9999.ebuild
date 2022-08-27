# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{7..10} )

inherit distutils-r1

if [[ "${PV}" = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/jupyterlab/jupyterlab.git"
else
	SRC_URI="https://github.com/jupyterlab/jupyterlab/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="The JupyterLab notebook server extension"
HOMEPAGE="https://jupyter.org"

LICENSE="BSD MIT GPL-3 Apache-2.0"
SLOT="0"

IUSE="ipympl slurm collaborative"

RDEPEND="
	dev-python/ipython[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	>=www-servers/tornado-6.1.0[${PYTHON_USEDEP}]
	dev-python/jupyter_core[${PYTHON_USEDEP}]
	>=dev-python/jupyterlab_server-2.10[${PYTHON_USEDEP}]
	>=dev-python/jupyter_server-1.16[${PYTHON_USEDEP}]

	>=dev-python/notebook_shim-0.1[${PYTHON_USEDEP}]
	>=dev-python/jinja-3.0.3[${PYTHON_USEDEP}]
	>=net-libs/nodejs-14

	>=dev-python/nbclassic-0.2[${PYTHON_USEDEP}]
	>=dev-python/jupyter-packaging-0.7.3[${PYTHON_USEDEP}]

	ipympl? (
		>=dev-python/ipympl-0.7[${PYTHON_USEDEP}]
	)
	slurm? (
		dev-python/jupyterlab-slurm[${PYTHON_USEDEP}]
	)
	collaborative? (
		dev-python/jupyterlab-link-share[${PYTHON_USEDEP}]
	)
"

python_install() {
	distutils-r1_python_install --skip-build
	mkdir -p "${D}/etc"
	mv "${D}/usr/etc/*" "${D}/etc/"
	rm "${D}/usr/etc" -r
	echo "export JUPYTERLAB_DIR=~/.jupyter/lab/assets" > jupyterlab-assets.sh
	insinto /etc/bash/bashrc.d
	doins "${S}/jupyterlab-assets.sh"
}

pkg_postinst() {
	if [ "$JUPYTERLAB_DIR" = "" ]; then
		elog ""
		elog "Before running jupyterlab in the existing shell please source"
		elog "./etc/bash/bashrc.d/jupyterlab-assets.sh"
		elog ""
 	fi
}
