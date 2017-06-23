# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

DESCRIPTION="Content-Addressable Data Synchronization Tool"
HOMEPAGE="https://github.com/systemd/casync/"
SRC_URI="https://github.com/systemd/casync/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sys-fs/fuse
"

DEPEND="${RDEPEND}
	dev-util/meson
	dev-util/ninja
	virtual/pkgconfig
	>=sys-kernel/linux-headers-4.5
"

src_install() {
	dobin build/casync
	dobin build/notify-wait
	exeinto /usr/lib/casync/protocols
	doexe build/casync-http
	dosym casync-http /usr/lib/casync/protocols/casync-https
	dosym casync-http /usr/lib/casync/protocols/casync-ftp
}
