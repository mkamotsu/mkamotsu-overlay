# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="This library provides a high level package-manager"
HOMEPAGE="https://github.com/rpm-software-management/libdnf"
SRC_URI="https://github.com/rpm-software-management/libdnf/archive/refs/tags/${PV}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# dnf install check-devel cppunit-devel gcc gcc-c++ glib2-devel gtk-doc json-c-devel libmodulemd-devel librepo-devel libsolv-devel libsolv-tools make python2-devel python3-devel python2-sphinx python3-sphinx python2-breathe python3-breathe rpm-devel sqlite-devel swig libsmartcols-devel
DEPEND="dev-util/cmake
	dev-libs/check
	dev-util/cppunit
	dev-libs/glib:2
	dev-util/gtk-doc
	dev-libs/json-c
	sys-libs/libmodulemd
	sys-libs/librepo
	sys-libs/libsolv
	dev-python/sphinx
	dev-python/breathe
	app-arch/rpm
	dev-db/sqlite
	dev-lang/swig
	sys-apps/util-linux"
RDEPEND="${DEPEND}"
BDEPEND=""

