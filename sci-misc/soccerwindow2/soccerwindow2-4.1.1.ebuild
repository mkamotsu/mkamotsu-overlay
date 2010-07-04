# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="soccerwindow2 is a viewer application for the the RoboCup soccer 2D
simulation."
HOMEPAGE="http://sourceforge.jp/projects/rctools/"
SRC_URI="mirror://sourceforge.jp/rctools/46739/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=x11-libs/qt-core-4.3 >=dev-libs/boost-1.32 >=sci-libs/librcsc-3.1"
RDEPEND="${DEPEND}"

src_configure() {
	local myconf="--enable-qt3=no --enable-fedit=yes"
	econf ${myconf} || die "econf failed"
}

src_install() {
emake DESTDIR=${D} install || die
}

