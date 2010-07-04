# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games

DESCRIPTION="The Robocup Soccor Simulator Monitor"
HOMEPAGE="http://sourceforge.net/projects/sserver"
SRC_URI="mirror://sourceforge/sserver/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=dev-libs/boost-1.32.0"
RDEPEND=""

src_compile () {
	econf || die "econf failed"
	make || die "emake failed"
}

src_install () {
	make DESTDIR=${D} install || die "install failed"
}

