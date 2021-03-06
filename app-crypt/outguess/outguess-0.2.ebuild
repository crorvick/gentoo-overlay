# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="A universal tool for inserting steganographic information into other data"
HOMEPAGE="http://www.outguess.org/"
SRC_URI="https://dl.packetstormsecurity.net/crypt/stego/outguess-0.2.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ppc x86"
IUSE=""

DEPEND="virtual/libc"

PATCHES=(
	"${FILESDIR}"/${P}-avoid-implicit-function-usage.patch
	"${FILESDIR}"/${P}-fix-printf-argument-types.patch
	"${FILESDIR}"/${P}-fix-segfault-when-encoding-PNM-images.patch
	"${FILESDIR}"/${P}-pass-struct-size-to-memset.patch
)

S=${WORKDIR}/${PN}

src_install() {
	dobin outguess || die "installation failed"
	doman outguess.1
}
