# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Libcomps is alternative for yum.comps library"
HOMEPAGE="https://github.com/rpm-software-management/libcomps"
SRC_URI="https://github.com/rpm-software-management/libcomps/archive/refs/tags/${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=">=dev-util/cmake-2.6
	sys-libs/zlib
	dev-libs/libxml2
	dev-libs/expat
	dev-libs/check
	app-doc/doxygen"
RDEPEND="${DEPEND}"
BDEPEND=""

CMAKE_USE_DIR="${S}/libcomps"

cmake_src_compile() {
	default
	python setup.py bdist_wheel
	python setup.py sdist
}

