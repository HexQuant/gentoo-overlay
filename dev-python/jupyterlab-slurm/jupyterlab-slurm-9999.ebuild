# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{6..9} )

DESCRIPTION="A Jupyter Notebook server extension that implements common Slurm commands"
HOMEPAGE="https://github.com/NERSC/jupyterlab-slurm"

if [[ "${PV}" = *9999* ]]; then
	inherit distutils-r1 git-r3
	EGIT_REPO_URI="https://github.com/NERSC/jupyterlab-slurm"
else
	inherit distutils-r1
	SRC_URI="https://github.com/NERSC/jupyterlab-slurm/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="BSD-2"
SLOT="0"
KEYWORDS=""

DEPEND="
	dev-python/jupyterlab[${PYTHON_USEDEP}]
	sys-cluster/slurm
	>=net-libs/nodejs-14
"
RDEPEND="${DEPEND}"
BDEPEND=""
