# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

EAPI=3

MY_P="${PN}.${PV}"

DESCRIPTION="素晴らしいついったークライアントです。"
HOMEPAGE="http://mikutter.d.hachune.net/"
SRC_URI="http://mikutter.d.hachune.net/bin/${MY_P}.tar.gz"

RESTRICT="mirror"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=dev-lang/ruby-1.8[ssl]
		dev-ruby/ruby-gnome2
		dev-ruby/ruby-hmac"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_unpack() {
	unpack "${A}"
	epatch "${FILESDIR}/${P}.patch"
}

src_prepare() {
	mv ${PN}.rb ${PN}
}

src_install() {
	insinto /usr/share/${PN}
	doins -r core/*
	insinto /usr/bin
	insopts "-m755"
	doins ${PN}
	dodoc README
	dohtml *.html
}

