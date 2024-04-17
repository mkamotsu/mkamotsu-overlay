# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="General-purpose programming language with an emphasis on functional programming"
HOMEPAGE="https://clojure.org/index"

SRC_URI="https://github.com/clojure/brew-install/releases/download/${PV}/clojure-tools-${PV}.tar.gz"

LICENSE="EPL-1.0 Apache-2.0 BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=virtual/jre-1.8 app-misc/rlwrap"
DEPEND=""
BDEPEND=""
S="${WORKDIR}/clojure-tools"

src_install() {
	insinto /usr/lib/clojure
	doins deps.edn
	doins example-deps.edn
	doins tools.edn
	insinto /usr/lib/clojure/libexec
	doins exec.jar
	doins clojure-tools-${PV}.jar
	sed -i -e 's@PREFIX@'"/usr/lib/clojure"'@g' clojure
	sed -i -e 's@BINDIR@'"/usr/bin"'@g' clj
	exeinto /usr/bin
	doexe clojure
	doexe clj
	doman clojure.1
	doman clj.1
}
