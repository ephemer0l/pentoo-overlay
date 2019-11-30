# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
#K_NOUSENAME="yes"
#K_NOSETEXTRAVERSION="yes"
K_SECURITY_UNSUPPORTED="1"
K_DEBLOB_AVAILABLE="1"
ETYPE="sources"
CKV='4.9.99'
inherit kernel-2 git-r3
detect_version

DESCRIPTION="Linux kernel source for the ODROID-[UX]2 products"
HOMEPAGE="https://github.com/hardkernel/linux"
EGIT_REPO_URI="https://github.com/hardkernel/linux.git"
EGIT_BRANCH="odroid-4.9.y"

KEYWORDS=""
IUSE="deblob"
