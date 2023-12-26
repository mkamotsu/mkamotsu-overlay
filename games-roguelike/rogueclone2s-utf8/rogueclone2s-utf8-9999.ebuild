# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 autotools flag-o-matic

DESCRIPTION="Rogue Clone II UTF8"
HOMEPAGE="https://github.com/naota/rogueclone2s-utf8"
EGIT_REPO_URI="https://github.com/naota/rogueclone2s-utf8.git"
LICENSE="ROGUECLONE2S"
SLOT="0"
IUSE=""
RESTRICT="strip"

RDEPEND="sys-libs/ncurses"
DEPEND="${RDEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}"/${P}-add-tinfow.patch
	"${FILESDIR}"/${P}-restore-damage.patch
)

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	append-ldflags $(no-as-needed)
	econf
}

src_install() {
	emake DESTDIR="${D}" install
	insinto /usr/share/rogue
	doins msg/mesg
	doins msg/mesg_E
}

