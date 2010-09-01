# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="soccerwindow2 is a viewer application for the the RoboCup soccer 2D
simulation."
HOMEPAGE="http://sourceforge.jp/projects/rctools/"
SRC_URI="mirror://sourceforge.jp/rctools/48790/${P}.tar.gz"

RESTRICT="mirror"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=x11-libs/qt-gui-4.3 >=dev-libs/boost-1.32 >=sci-libs/librcsc-4.0"
RDEPEND="${DEPEND}"

src_configure() {
	econf || die
}

src_install() {
	emake DESTDIR=${D} install || die
	dodoc AUTHORS COPYING ChangeLog ChangeLog.qt NEWS NEWS.en README
}

