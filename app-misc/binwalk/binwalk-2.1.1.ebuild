# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
#
# This ebuild was posted for a version bump as bug 574394 by Anton Bolshavok:
# 
# https://github.com/pentoo/pentoo-overlay/blob/master/app-misc/binwalk/binwalk-2.1.1.ebuild

EAPI=5
PYTHON_COMPAT=( python{2_7,3_3,3_4} )

inherit distutils-r1

DESCRIPTION="A tool for identifying files embedded inside firmware images"
HOMEPAGE="https://github.com/devttys0/binwalk"
SRC_URI="https://github.com/devttys0/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="graph squashfs"

RDEPEND="
	dev-python/backports-lzma
	dev-python/pyliblzma
	sys-apps/file[${PYTHON_USEDEP}]
	graph? ( dev-python/pyqtgraph[opengl,${PYTHON_USEDEP}] )
	squashfs? ( sys-fs/squashfs-tools:0
		sys-fs/sasquatch
	)
"
