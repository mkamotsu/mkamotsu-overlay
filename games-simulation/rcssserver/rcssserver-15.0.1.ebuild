# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit games

DESCRIPTION="The RoboCup Soccer Simulator Server"
HOMEPAGE="http://sourceforge.net/projects/sserver"
SRC_URI="mirror://sourceforge/sserver/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~amd64-linux ~x86 ~x86-linux"
IUSE=""

DEPEND=">=dev-libs/boost-1.32.0 sys-devel/flex"
RDEPEND="${DEPEND}"

src_configure() {
	econf || die "econf failed"
}

src_compile() {
	emake -j1 || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
	dodoc AUTHORS ChangeLog NEWS README
}

