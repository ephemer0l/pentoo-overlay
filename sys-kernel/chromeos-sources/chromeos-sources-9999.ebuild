# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
inherit kernel-2 linux-info git-r3

#K_NOUSENAME="yes"
#K_NOSETEXTRAVERSION="yes"
K_SECURITY_UNSUPPORTED="1"
K_DEBLOB_AVAILABLE="1"
K_FROM_GIT="1"
ETYPE="sources"
#CKV='4.4.0'
#KV_MAJOR="5"

DESCRIPTION="Linux kernel source for the Samsung Chromebook"
HOMEPAGE="https://chromium.googlesource.com/chromiumos/third_party/kernel/+/chromeos-4.4"
EGIT_REPO_URI="https://chromium.googlesource.com/chromiumos/third_party/kernel"
EGIT_BRANCH="next/chromeos-next"

KEYWORDS=""
IUSE="deblob"

SLOT="0"

src_prepare() {
	get_version
}

pkg_postinst() {
	einfo "if you want to get the default kernel config just run:"
	einfo "./chromeos/scripts/prepareconfig chromeos-exynos5"
}
