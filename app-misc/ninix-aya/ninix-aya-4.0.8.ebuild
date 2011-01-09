# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit python

IUSE=""

DESCRIPTION="Desktop mascot currently called that like 'Are Igai No Nanika' for X"
HOMEPAGE="http://ninix-aya.sourceforge.jp/"
SRC_URI="mirror://sourceforge.jp/${PN}/50278/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~x86"

DEPEND=">=dev-lang/python-2.4
	>=x11-libs/gtk+-2.8
	>=dev-python/pygtk-2.6
	app-arch/unzip
	app-arch/lha
	!app-misc/aya5"

src_unpack(){
	unpack ${A}
	sed -i -e '/^[[:blank:]]\+-cp/d' "${S}"/modules/Makefile.modules
}

src_compile(){
	emake prefix=/usr \
		exec_libdir=/usr/$(get_libdir)/$(PYTHON)/site-packages/${PN} \
		docdir=/usr/share/doc/${PF} \
		NINIX=ninix \
		NINIX_INSTALL=ninix-install \
		NINIX_LOOKUP=ninix-lookup \
		NINIX_UPDATE=ninix-update \
		|| die "Compile failed."
}

src_install(){
	emake DESTDIR="${D}" \
		prefix=/usr \
		exec_libdir=/usr/$(get_libdir)/$(PYTHON)/site-packages/${PN} \
		docdir="${D}"/usr/share/doc/${PF} \
		NINIX=ninix \
		NINIX_INSTALL=ninix-install \
		NINIX_LOOKUP=ninix-lookup \
		NINIX_UPDATE=ninix-update \
		install || die "Install failed."

	cd "${S}"/doc
	docinto doc
	dodoc *
	prepalldocs
}
