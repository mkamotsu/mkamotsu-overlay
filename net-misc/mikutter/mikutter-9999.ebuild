# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion

EAPI=3

DESCRIPTION="A moest twitter client"
HOMEPAGE="http://mikutter.d.hachune.net/"
ESVN_REPO_URI="svn://toshia.dip.jp/mikutter/trunk"
ESVN_PATCHES="${P}.patch"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=dev-lang/ruby-1.8[ssl]
		dev-ruby/ruby-gnome2
		dev-ruby/ruby-hmac"
RDEPEND="${DEPEND}"

src_prepare() {
	subversion_bootstrap
	mv ${PN}.rb ${PN}
}

src_install() {
	insinto /usr/share/${PN}
	doins -r core/*
	insinto /usr/bin
	insopts "-m755"
	doins ${PN}
	dodoc README
}

