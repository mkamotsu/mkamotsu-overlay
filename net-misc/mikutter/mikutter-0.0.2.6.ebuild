# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils

MY_P="${PN}.${PV}"

DESCRIPTION="全てのミク廃、そしてTwitter中毒者へ贈る、至高のTwitter Clientを目指すTwitter Client。略して至高のTwitter Client。"
HOMEPAGE="http://mikutter.hachune.net/"
SRC_URI="http://mikutter.hachune.net/bin/${MY_P}.tar.gz"

RESTRICT="mirror"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~x86-linux ~amd64-linux"
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

