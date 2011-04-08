# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils

MY_P="${PN}.${PV}"

DESCRIPTION="mikutter is simple, powerful and moeful twitter client."
HOMEPAGE="http://mikutter.hachune.net/"
SRC_URI="http://mikutter.hachune.net/bin/${MY_P}.tar.gz"

SLOT="0"
KEYWORDS="~amd64 ~amd64-linux ~x86 ~x86-linux"
IUSE=""

DEPEND=""
RDEPEND=">=dev-lang/ruby-1.8[ssl]
	 dev-ruby/ruby-gnome2
	 dev-ruby/ruby-hmac
	 dev-ruby/sqlite3-ruby
	 dev-ruby/httpclient
	 x11-libs/libnotify"

S="${WORKDIR}/${PN}"

src_install() {
	exeinto /usr/share/mikutter
	doexe mikutter.rb
	insinto /usr/share/mikutter
	doins -r core plugin
	exeinto /usr/bin
	doexe "${FILESDIR}"/${PN}
	exeinto /usr/share/applications
	doexe "${FILESDIR}"/${PN}.desktop
	dodoc LICENSE README
}

