# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="GSL Wrapper for C++"
HOMEPAGE="http://sourceforge.net/projects/gslwrap"
SRC_URI="mirror://sourceforge/gslwrap/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="sci-libs/gsl"
RDEPEND="${DEPEND}"

src_compile() {
	econf
	emake
}

src_install() {
	make install DESTDIR=${D}	
}

