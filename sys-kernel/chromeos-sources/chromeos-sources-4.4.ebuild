# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
inherit kernel-2 git-r3
detect_version

#K_NOUSENAME="yes"
#K_NOSETEXTRAVERSION="yes"
K_SECURITY_UNSUPPORTED="1"
K_DEBLOB_AVAILABLE="1"
K_FROM_GIT="1"
ETYPE="sources"
CKV='4.4.0'

DESCRIPTION="Linux kernel source for the Samsung Chromebook"
HOMEPAGE="https://chromium.googlesource.com/chromiumos/third_party/kernel/+/chromeos-4.4"
EGIT_REPO_URI="https://chromium.googlesource.com/chromiumos/third_party/kernel"
EGIT_BRANCH="chromeos-4.4"

KEYWORDS=""
IUSE="deblob"

SLOT="0"

pkg_postinst() {
	einfo "if you want to get the default kernel config just run:"
	einfo "./chromeos/scripts/prepareconfig chromeos-exynos5"
}
