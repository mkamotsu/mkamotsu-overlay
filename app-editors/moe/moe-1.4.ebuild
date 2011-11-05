# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="GNU Moe is a powerful, 8-bit clean, console text editor for
ISO-8859 and ASCII character encodings. "
HOMEPAGE="http://www.gnu.org/software/moe/moe.html"
SRC_URI="http://download.savannah.gnu.org/releases/moe/${P}.tar.lz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=sys-devel/gcc-3.3.6
        >=sys-libs/ncurses-5.4
		app-arch/lzip"
RDEPEND=""

src_unpack() {
	lzip -cd ${DISTDIR}/${A} | tar -xf -
}

src_install() {
	emake DESTDIR="${D}" install || die "make install failed"
	dodoc AUTHORS ChangeLog NEWS README || die "dodoc failed"
}

