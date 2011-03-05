# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

<<<<<<< HEAD
EAPI=3

inherit eutils

=======
inherit eutils

EAPI=3

>>>>>>> 7fdd5ccc3a9b4a2247a345cad73dcf20272af508
MY_P="${PN}.${PV}"

DESCRIPTION="全てのミク廃、そしてTwitter中毒者へ贈る、至高のTwitter Clientを目指すTwitter Client。略して至高のTwitter Client。"
HOMEPAGE="http://mikutter.d.hachune.net/"
SRC_URI="http://mikutter.d.hachune.net/bin/${MY_P}.tar.gz"

<<<<<<< HEAD
=======
RESTRICT="mirror"

>>>>>>> 7fdd5ccc3a9b4a2247a345cad73dcf20272af508
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=dev-lang/ruby-1.8[ssl]
		dev-ruby/ruby-gnome2
		dev-ruby/ruby-hmac
		dev-ruby/sqlite3-ruby
		dev-ruby/httpclient
		x11-libs/libnotify"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_install() {
	exeinto /usr/share/mikutter
	doexe mikutter.rb
	insinto /usr/share/mikutter
	doins -r core plugin
	exeinto /usr/bin
	doexe ${FILESDIR}/mikutter
	dodoc LICENSE README
}

