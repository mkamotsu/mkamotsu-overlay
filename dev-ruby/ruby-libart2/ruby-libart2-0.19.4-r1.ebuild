# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/ruby-libart2/ruby-libart2-0.19.4.ebuild,v 1.5 2010/10/20 21:58:56 ranger Exp $

EAPI="2"
USE_RUBY="ruby18"

inherit ruby-ng-gnome2

DESCRIPTION="Ruby Libart2 bindings"
KEYWORDS="~x86-linux ~amd64-linux"
IUSE=""
RDEPEND="${RDEPEND}
	>=media-libs/libart_lgpl-2"
DEPEND="${DEPEND}
	>=media-libs/libart_lgpl-2
	dev-util/pkgconfig"

ruby_add_rdepend ">=dev-ruby/ruby-glib2-${PV}"
