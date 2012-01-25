# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Rust is a curly-brace, block-structured expression language."
HOMEPAGE="http://www.rust-lang.org"
SRC_URI="http://dl.rust-lang.org/dist/rust-0.1.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="|| ( sys-devel/gcc:4.4[cxx] =sys-devel/clang-3 )
        >=dev-lang/python-2.6
		>=dev-lang/perl-5.0
		>=sys-devel/make-3.8.1
		net-misc/curl"
RDEPEND="${DEPEND}"

src_install() {
	exeinto /usr/bin
	doexe x86_64-unknown-linux-gnu/stage3/bin/rustc || die
	doexe x86_64-unknown-linux-gnu/stage3/bin/cargo || die
	doexe x86_64-unknown-linux-gnu/stage3/bin/rustdoc || die
	insinto /usr/lib
	doins x86_64-unknown-linux-gnu/stage2/lib/librustrt.so || die
	for lib in `ls -rt1 x86_64-unknown-linux-gnu/stage2/lib/libcore-*.so | tail -1`; do
		doins ${lib} || die
	done
	for lib in `ls -rt1 x86_64-unknown-linux-gnu/stage2/lib/libstd-*.so | tail -1`; do
		doins ${lib} || die
	done
	for lib in `ls -rt1 x86_64-unknown-linux-gnu/stage2/lib/librustc-*.so | tail -1`; do
		doins ${lib} || die
	done
	doins x86_64-unknown-linux-gnu/stage2/lib/librustllvm.so || die
	doman man/rustc.1
	insinto /usr/lib/rustc/x86_64-unknown-linux-gnu/lib
	doins x86_64-unknown-linux-gnu/stage2/lib/rustc/x86_64-unknown-linux-gnu/lib/librustrt.so
	for lib in `ls -rt1 x86_64-unknown-linux-gnu/stage2/lib/rustc/x86_64-unknown-linux-gnu/lib/libcore-*.so | tail -1`; do
		doins ${lib} || die
	done
	for lib in `ls -rt1 x86_64-unknown-linux-gnu/stage2/lib/rustc/x86_64-unknown-linux-gnu/lib/libstd-*.so | tail -1`; do
		doins ${lib} || die
	done
	for lib in `ls -rt1 x86_64-unknown-linux-gnu/stage2/lib/rustc/x86_64-unknown-linux-gnu/lib/librustc-*.so | tail -1`; do
			doins ${lib} || die
	done
	doins x86_64-unknown-linux-gnu/stage2/lib/rustc/x86_64-unknown-linux-gnu/lib/intrinsics.bc
	doins x86_64-unknown-linux-gnu/stage2/lib/rustc/x86_64-unknown-linux-gnu/lib/libmorestack.a
}

