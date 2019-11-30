# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-info linux-mod

DESCRIPTION="A kernel module for the ASIX USB 3.0 AX88179 ethernet controller"
HOMEPAGE="http://www.asix.com.tw/download.php?sub=driverdetail&PItemID=131"
SRC_URI="https://www.asix.com.tw/FrootAttach/driver/AX88179_178A_LINUX_DRIVER_v1.19.0_SOURCE.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/${PN^^}_LINUX_DRIVER_v${PV}_SOURCE"

CONFIG_CHECK="USB_USBNET"
MODULE_NAMES="${PN}(net/usb:)"
BUILD_TARGETS="default"

src_prepare() {
	sed -i 's/make -C/${MAKE} -C/' Makefile || die
	sed -i "s/\$(shell uname -r)/${KV_FULL}/" Makefile || die
}
