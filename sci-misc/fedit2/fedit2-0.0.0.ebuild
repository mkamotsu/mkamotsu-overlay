# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="fedit2 is formation editor for RoboCup Soccer Simulation"
HOMEPAGE="http://rctools.sourceforge.jp/"
SRC_URI="mirror://sourceforge.jp/rctools/48791/${P}.tar.gz"

RESTRICT="mirror"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=x11-libs/qt-gui-4.3 >=dev-libs/boost-1.32 >=sci-libs/librcsc-4.0"
RDEPEND="${DEPEND}"

src_install() {
	emake prefix="${ED}/usr" install || die
	dodoc AUTHORS COPYING ChangeLog NEWS README
}

