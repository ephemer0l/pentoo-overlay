# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rpm eutils toolchain-funcs flag-o-matic

DESCRIPTION="Red Hat Hardware detection tools"
HOMEPAGE="http://rhlinux.redhat.com/kudzu/"
SRC_URI="https://kojipkgs.fedoraproject.org//vol/fedora_koji_archive00/packages/kudzu/1.2.85/1/src/kudzu-1.2.85-1.src.rpm"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE="zlib"

DEPEND="dev-libs/popt
	zlib? ( sys-libs/zlib )
	>=sys-apps/pciutils-2.2.4"
RDEPEND="${DEPEND}
	sys-apps/hwdata-redhat
	!sys-apps/kudzu"

S=${WORKDIR}/kudzu-1.2.85

src_compile() {
	if use zlib ; then
		perl -pi -e 's| -lpci| -lz -lpci|g' Makefile
	elif ! use zlib ; then
		die "You need to build with USE=zlib to match sys-apps/pcituils"
	fi
	# Fix the modules directory to match Gentoo layout.
	perl -pi -e 's|/etc/modutils/kudzu|/etc/modules.d/kudzu|g' *.*

	if use ppc && [ "$(tc-arch-kernel)" != "ppc" ]; then
		emake libkudzu.a ARCH="ppc" \
			RPM_OPT_FLAGS="${CFLAGS}" || die
	else
		emake libkudzu.a ARCH=$(tc-arch-kernel) \
			RPM_OPT_FLAGS="${CFLAGS}" || die
	fi
}

src_install() {
	keepdir /etc/sysconfig
	insinto /usr/include/kudzu
	doins *.h
	dolib.a libkudzu.a
}
