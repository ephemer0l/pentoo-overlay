# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5,6} )
inherit distutils-r1

MY_PN=${PN/-bin/}
MY_P=${MY_PN}-${PV}

DESCRIPTION="Library to instrument executable formats"
HOMEPAGE="https://lief.quarkslab.com/"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.zip
	https://github.com/lief-project/LIEF/releases/download/${PV}/${MY_P}-py2.7-linux.egg
	https://github.com/lief-project/LIEF/releases/download/${PV}/${MY_P}-py3.6-linux.egg"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

QA_FLAGS_IGNORED="usr/lib.*/python.*/site-packages/_pylief.*\.so"

RDEPEND=""
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

S=${WORKDIR}/${MY_P}

src_prepare() {
	#copy symlinks to homedir for offline installation
	cp -s "${DISTDIR}"/${MY_P}-py2.7-linux.egg "${HOME}"
	cp -s "${DISTDIR}"/${MY_P}-py3.6-linux.egg "${HOME}"
	default
}

src_install() {
	distutils-r1_src_install
	dobin "${FILESDIR}/lief_inject.py"
}
