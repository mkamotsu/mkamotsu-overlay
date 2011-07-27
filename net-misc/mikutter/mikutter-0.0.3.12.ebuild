# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

USE_RUBY="ruby18"

inherit ruby-ng

MY_P="${PN}.${PV}"

DESCRIPTION="mikutter is simple, powerful and moeful twitter client"
HOMEPAGE="http://mikutter.hachune.net/"
SRC_URI="http://mikutter.hachune.net/bin/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="$(ruby_implementation_depend ruby18 '>=' -1.8.7)[ssl]
	x11-libs/libnotify"

ruby_add_rdepend "dev-ruby/ruby-gtk2
	dev-ruby/ruby-hmac
	dev-ruby/sqlite3-ruby
	dev-ruby/httpclient"

S="${WORKDIR}/${PN}"

each_ruby_install() {
	exeinto /usr/share/mikutter
	doexe mikutter.rb
	insinto /usr/share/mikutter
	doins -r core plugin
	insinto /usr/share/applications
	doins "${FILESDIR}/${PN}.desktop"
	exeinto /usr/bin
	doexe "${FILESDIR}"/mikutter
	dodoc README
}
