# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Interactive fake-AI Ukagaka-compatible desktop mascot program"
HOMEPAGE="http://ninix-aya.sourceforge.jp/"
SRC_URI="mirror://sourceforge.jp/${PN}/58500/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gnome"

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-lang/python-2.6.6
	>=x11-libs/gtk+-2.20.1
	>=dev-python/numpy-1.4.1
	>=dev-python/pygtk-2.17.0
	>=dev-python/gst-python-0.10.19
	>=dev-python/chardet-2.0.1
	>=dev-python/httplib2-0.6.0
	gnome? ( >=dev-python/gconf-python-2.28.1 )"

src_compile() {
	for l in ja zh_TW; do
		mkdir -p locale/"${l}"/LC_MESSAGES
		msgfmt locale/"${l}".po -o locale/"${l}"/LC_MESSAGES/"${l}".mo
	done
	sed -e "s,@python,python,g" -e "s,@libdir,${EPREFIX}/usr/lib/${PN},g" bin/ninix.in > bin/ninix
	sed -e "s,@python,python,g" -e "s,@libdir,${EPREFIX}/usr/lib/${PN},g" bin/ninix-install.in > bin/ninix-install
}

src_install() {
	insinto "${EPREFIX}"/usr/lib/${PN}
	doins -r lib/*
	insinto "${EPREFIX}"/usr/share/locale
	for l in ja zh_TW; do
		doins -r locale/"${l}"
	done
	exeinto "${EPREFIX}"/usr/bin
	doexe bin/ninix bin/ninix-install
	dodoc README README.ninix TODO.ninix doc/extension.txt doc/kawari.txt doc/saori.txt COPYING ChangeLog
}

