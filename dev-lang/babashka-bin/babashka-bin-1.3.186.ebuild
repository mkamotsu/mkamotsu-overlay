# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DESCRIPTION="Babashka is a native Clojure interpreter for scripting with fast startup."
HOMEPAGE="https://babashka.org/"
SRC_URI="https://github.com/babashka/babashka/releases/download/v${PV}/babashka-${PV}-linux-amd64.tar.gz"

S="${WORKDIR}"
LICENSE="EPL-1.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND=""

src_configure() {
	true
}

src_compile() {
	true
}

src_install() {
	exeinto /usr/bin
	doexe bb
}

