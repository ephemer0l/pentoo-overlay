# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils flag-o-matic rpm

# Tag for which Fedora Core version it's from
FCVER="9"
# Revision of the RPM. Shouldn't affect us, as we're just grabbing the source
# tarball out of it
RPMREV="1"

MY_P="${P/-redhat}"
DESCRIPTION="Hardware identification and configuration data"
HOMEPAGE="https://fedora.redhat.com/projects/config-tools/"
SRC_URI="https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/9/Everything/source/SRPMS/${MY_P}-${RPMREV}.fc${FCVER}.src.rpm"
LICENSE="GPL-2 MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE="test"
RDEPEND="virtual/modutils
	!sys-apps/hwdata-gentoo"
DEPEND="${RDEPEND}
	test? ( sys-apps/pciutils )"
S="${WORKDIR}/${MY_P}"

PATCHES="${FILESDIR}/${P}-python-3.patch"

src_prepare() {
	sed -i -e "s:\(/sbin\/lspci\):/usr\1:g" Makefile || die
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	# Don't let it overwrite a udev-installed file
	rm -rf "${D}"/etc/ || die
}
