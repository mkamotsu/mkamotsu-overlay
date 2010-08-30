# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

EAPI=3

MY_P="${PN}.${PV}"

DESCRIPTION="全てのミク廃、そしてTwitter中毒者へ贈る、至高のTwitter Clientを目指すTwitter Client。略して至高のTwitter Client。"
HOMEPAGE="http://mikutter.d.hachune.net/"
SRC_URI="http://mikutter.d.hachune.net/bin/${MY_P}.tar.gz"

RESTRICT="mirror"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=dev-lang/ruby-1.8[ssl]
		dev-ruby/ruby-gnome2
		dev-ruby/ruby-hmac"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_unpack() {
	unpack ${A}
	epatch "${FILESDIR}/${P}.patch"
}

src_prepare() {
	mv ${PN}.rb ${PN}
}

src_install() {
	insinto /usr/share/${PN}/core
	doins -r core/*
	insinto /usr/share/${PN}/plugin
	doins -r plugin/*
	insinto /usr/bin
	insopts "-m755"
	doins ${PN}
	dodoc LICENSE
	dodoc README
	dohtml *.html
}

