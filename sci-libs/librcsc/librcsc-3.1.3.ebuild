# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="librcsc is a base library to develop a soccer agent and tool
programs for the RoboCup soccer 2D simulation."
HOMEPAGE="http://sourceforge.jp/projects/rctools/"
SRC_URI="mirror://sourceforge.jp/rctools/47055/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=dev-libs/boost-1.32"
RDEPEND="${DEPEND}"

src_compile() {
	econf || die "could not configure"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR=${D} install || die
}

