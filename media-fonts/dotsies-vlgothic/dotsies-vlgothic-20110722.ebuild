# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit font

EAPI=3

DESCRIPTION="Composition Dotsies and VL Gothic"
HOMEPAGE="http://dotsies.org/
http://dicey.org/vlgothic/"
SRC_URI="http://dotsies.org/Dotsies.ttf
mirror://sourceforge.jp/vlgothic/52711/VLGothic-${PV}.tar.bz2"

LICENSE="vlgothic mplus-fonts BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="media-gfx/fontforge"
RDEPEND="${DEPEND}"

S="${WORKDIR}/VLGothic"

FONT_SUFFIX="ttf"
FONT_S="${S}"
DOCS="Changelog README*"

src_unpack() {
	unpack "VLGothic-${PV}.tar.bz2"
	cp "${DISTDIR}/Dotsies.ttf" ${S}
	cp "${FILESDIR}/compose.pe" ${S}
}

src_compile() {
	TARGETS="VL-Gothic-Regular.ttf VL-PGothic-Regular.ttf"
	for TARGET in ${TARGETS}; do
		/usr/bin/fontforge -script compose.pe Dotsies.ttf ${TARGET}
		rm ${TARGET}
	done
	rm Dotsies.ttf
}
