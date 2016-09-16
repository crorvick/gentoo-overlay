# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Finds image files with steganographic content"
HOMEPAGE="http://www.outguess.org/"
SRC_URI="https://dl.packetstormsecurity.net/crypt/stego/stegdetect-0.6.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="virtual/libc"

PATCHES=(
	"${FILESDIR}"/${P}-avoid-overlapping-debug-variables.patch
	"${FILESDIR}"/${P}-modernize-auto-conf-make-API-usage.patch
	"${FILESDIR}"/${P}-update-files-generated-by-autotools.patch
	"${FILESDIR}"/${P}-add-noops-for-unsupported-arguments.patch
)

S=${WORKDIR}/${P}

src_install() {
	dobin stegdetect || die "installation failed"
	dobin stegbreak || die "installation failed"
	doman stegdetect.1
	doman stegbreak.1
}
