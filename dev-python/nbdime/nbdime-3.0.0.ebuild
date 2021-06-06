# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9})

inherit distutils-r1

DESCRIPTION="Jupyter Notebook Diff and Merge tools"
HOMEPAGE="https://github.com/jupyter/nbdime"
SRC_URI="https://github.com/jupyter/nbdime/archive/${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"

LICENSE="BSD"
SLOT="0"
IUSE="doc test webtools"
RESTRICT="!test? ( test )"

RDEPEND="
	dev-python/nbformat[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/colorama[${PYTHON_USEDEP}]
	www-servers/tornado[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	webtools? ( net-libs/nodejs[npm] )
	dev-python/notebook[${PYTHON_USEDEP}]
	>=dev-python/jinja-2.9[${PYTHON_USEDEP}]
	"
DEPEND="${RDEPEND}
	doc? (
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/recommonmark[${PYTHON_USEDEP}]
		dev-python/sphinx_rtd_theme[${PYTHON_USEDEP}]
	)
	test? (
		>=dev-python/pytest-3.6[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
	    dev-python/pytest-tornado5-2[${PYTHON_USEDEP}]
		dev-python/jsonschema[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/tabulate[${PYTHON_USEDEP}]
	)
	"

python_configure_all() {
	if ! use webtools; then
		mydistutilsargs=( --skip-npm )
	fi
}

python_compile_all() {
	if use doc; then
		emake -C docs html
		HTML_DOCS=( docs/build/html/. )
	fi
}

python_test() {
	# user.email and user.name are not configured in the sandbox.
	git config --global user.email "you@example.com" || die
	git config --global user.name "Your Name" || die

	distutils_install_for_testing

	py.test -l || die
}
