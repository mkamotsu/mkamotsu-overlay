# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake tmpfiles bash-completion-r1

DESCRIPTION="Dandified YUM (DNF) is the next upcoming major version of YUM."
HOMEPAGE="https://github.com/rpm-software-management/dnf"
SRC_URI="https://github.com/rpm-software-management/dnf/archive/refs/tags/${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=">=dev-lang/python-3
	dev-python/sphinx
	sys-libs/libdnf
	app-arch/rpm[python]
	sys-libs/libcomps"
RDEPEND="${DEPEND}"
BDEPEND=""

MYCMAKEARGS='-DPYTHON_DESIRED="3" -DWITH_MAN=0'

pkg_postinst() {
	default
	# tmpfiles_process
}

src_install() {
	default
	cmake_src_install
	bashcomp_alias dnf dnf-2 dnf-3
}

