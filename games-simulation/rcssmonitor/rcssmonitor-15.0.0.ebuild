# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit games

DESCRIPTION="The Robocup Soccor Simulator Monitor"
HOMEPAGE="http://sourceforge.net/projects/sserver"
SRC_URI="mirror://sourceforge/sserver/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-libs/boost-1.32.0
	x11-libs/qt-gui:4
	x11-libs/qt-opengl:4"
RDEPEND=""

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS ChangeLog NEWS README
}

