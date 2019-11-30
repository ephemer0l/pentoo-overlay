# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit mozilla-addon

GITHUB_REVISION="1e8171d186341c5cc2bb64d23865925db437a258"

DESCRIPTION="FxPnH is a Firefox addon adding support for Plug-n-Hack providers"
HOMEPAGE="https://github.com/mozmark/ringleader"
SRC_URI="https://github.com/mozmark/ringleader/raw/${GITHUB_REVISION}/fx_pnh.xpi -> ${P}.xpi"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+symlink_all_targets target_firefox target_firefox-bin"

RDEPEND="
	!symlink_all_targets? (
		target_firefox? ( >=www-client/firefox-24.1.1 )
		target_firefox-bin? ( >=www-client/firefox-bin-24.1.1 )
	)"

src_install() {
	# symlink all possible target paths if this is set
	if use symlink_all_targets; then
		MZA_TARGETS="firefox firefox-bin"
	else
		use target_firefox && MZA_TARGETS+=" firefox"
		use target_firefox-bin && MZA_TARGETS+=" firefox-bin"
	fi
		mozilla-addon_src_install
}
