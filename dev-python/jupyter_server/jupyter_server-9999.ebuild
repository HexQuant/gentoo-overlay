# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A core services, APIs, and REST endpoints - to Jupyter web applications"
HOMEPAGE="https://github.com/jupyter/jupyter_server"

PYTHON_COMPAT=( python3_{7..10} )

inherit distutils-r1

if [[ "${PV}" = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/jupyter-server/jupyter_server.git"
else
	SRC_URI="https://github.com/jupyter/jupyter_server/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="BSD"
SLOT="0"

RDEPEND="
	>=dev-python/anyio-3.1.0[${PYTHON_USEDEP}]
	<dev-python/anyio-4[${PYTHON_USEDEP}]
	dev-python/argon2-cffi[${PYTHON_USEDEP}]
	>=dev-python/jinja-2[${PYTHON_USEDEP}]
	>=dev-python/jupyter_client-6.1.12[${PYTHON_USEDEP}]
	>=dev-python/jupyter_core-4.7.0[${PYTHON_USEDEP}]
	>=dev-python/nbconvert-6.4.4[${PYTHON_USEDEP}]
	>=dev-python/nbformat-5.2.0[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/prometheus_client[${PYTHON_USEDEP}]
	>=dev-python/pyzmq-17[${PYTHON_USEDEP}]
	dev-python/send2trash[${PYTHON_USEDEP}]
	>=dev-python/terminado-0.8.3[${PYTHON_USEDEP}]
	>=www-servers/tornado-6.1[${PYTHON_USEDEP}]
	>=dev-python/traitlets-5.1.0[${PYTHON_USEDEP}]
	dev-python/websocket-client[${PYTHON_USEDEP}]
	dev-python/jupyter-telemetry[${PYTHON_USEDEP}]
	"

BDEPEND="
	test? (
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/pytest-tornasync[${PYTHON_USEDEP}]
		dev-python/pytest-console-scripts[${PYTHON_USEDEP}]
		dev-python/ipykernel[${PYTHON_USEDEP}]
	)"

distutils_enable_sphinx docs/source \
	dev-python/pydata-sphinx-theme \
	dev-python/myst_parser \
	dev-python/ipython \
	dev-python/sphinxemoji \
	dev-python/sphinxcontrib-github-alt \
	dev-python/sphinxcontrib-openapi
distutils_enable_tests --install pytest

EPYTEST_DESELECT=(
	# This fails if your terminal is zsh (and maybe other non-bash as well?)
	tests/test_terminal.py::test_terminal_create_with_cwd
	tests/test_terminal.py::test_culling
)
