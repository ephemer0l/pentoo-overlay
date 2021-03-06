# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{6,7} )

inherit distutils-r1

DESCRIPTION="CLI for SQLite Databases with auto-completion and syntax highlighting"
HOMEPAGE="https://github.com/dbcli/litecli"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

KEYWORDS="~amd64 ~x86"
LICENSE="BSD"
SLOT="0"

RDEPEND="
	>=dev-python/click-4.1[${PYTHON_USEDEP}]
	>=dev-python/pygments-1.6[${PYTHON_USEDEP}]
	>=dev-python/prompt_toolkit-2.0.0[${PYTHON_USEDEP}] <dev-python/prompt_toolkit-2.1.0
	>=dev-python/python-sqlparse-0.2.2[${PYTHON_USEDEP}] <dev-python/python-sqlparse-0.3.0
	>=dev-python/configobj-5.0.5[${PYTHON_USEDEP}]
	>=dev-python/cli_helpers-1.0.1[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"
