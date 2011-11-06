# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit qt4-r2 git-2 flag-o-matic

DESCRIPTION="Twitter client by Qt."
HOMEPAGE="http://qween.tnose.net/"
EGIT_REPO_URI="git://github.com/plus7/Qween.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=x11-libs/qt-core-4.6
        >=x11-libs/qt-gui-4.6
        dev-libs/openssl"
RDEPEND=""

pkg_setup() {
	append-flags -fpermissive
	append-ldflags $(no-as-needed)
}

src_compile() {
	eqmake4
	emake || die
}

src_install() {
	exeinto /usr/bin
	doexe Qween
	dodoc ChangeLog.xml
}

