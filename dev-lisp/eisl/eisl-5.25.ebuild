# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Easy-ISLisp(EISL) Interpreter and compiler compatible with the ISLisp standard."
HOMEPAGE="https://github.com/sasagawa888/eisl"
EGIT_REPO_URI="https://github.com/sasagawa888/eisl.git"
EGIT_COMMIT="v5.25"

LICENSE="eisl"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}"
BDEPEND="dev-util/cppcheck"

RESTRICT="strip"

src_install() {
	exeinto /usr/share/bin
	doexe eisl
	doexe edlis
	dodir /usr/share/eisl/library
	insinto /usr/share/eisl/library
	doins library/*
	dodir /usr/share/eisl
	insinto /usr/share/eisl
	doins fast.h
	doins ffi.h
}

