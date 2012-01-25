# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Rust is a curly-brace, block-structured expression language."
HOMEPAGE="http://www.rust-lang.org"
SRC_URI="http://dl.rust-lang.org/dist/rust-0.1.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="|| ( sys-devel/gcc:4.4[cxx] =sys-devel/clang-3 )
        >=dev-lang/python-2.6
		>=dev-lang/perl-5.0
		>=sys-devel/make-3.8.1
		net-misc/curl"
RDEPEND="${DEPEND}"

