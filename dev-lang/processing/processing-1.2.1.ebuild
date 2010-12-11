# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="http://processing.googlecode.com/files/${P}.tgz"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install(){
	insinto /usr/share/${PN}
	doins -r examples lib java libraries
	doins -r reference tools
	exeinto /usr/share/${PN}
	doexe processing
	exeinto /usr/bin/
	doexe ${FILESDIR}/processing
	dodoc revisions.txt
}

