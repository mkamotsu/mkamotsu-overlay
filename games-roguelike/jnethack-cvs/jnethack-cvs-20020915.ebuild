# Copyright 1999-2002 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header:$

ECVS_BRANCH=""
ECVS_SERVER="cvs.sourceforge.jp:/cvsroot/jnethack"
ECVS_USER="anonymous"
ECVS_MODULE="jnethack"

inherit cvs

S=${WORKDIR}/${ECVS_MODULE}
DESCRIPTION="Japanized Nethack"
HOMEPAGE="http://jnethack.sourceforge.jp/"

SLOT="0"
KEYWORDS="x86 ppc sparc sparc64"
LICENSE="GPL"

DEPEND="${DEPEND}
	sys-devel/flex
	sys-devel/bison
	>=sys-libs/ncurses-5.2-r5"
RDEPEND="${DEPEND}"

HACKDIR="/usr/lib/jnethackdir"
VARDIR="/var/lib/jnethack"

src_unpack() {
	cvs_src_unpack

	cd ${S}/sys/unix
	source setup.sh || die

	# GRAPHIC_TOMBSTONE not available yet?
	cd ${S}/include
	mv config.h config.h.orig
	sed -e 's:^\(#[ \t]*define HACKDIR\) .*:\1 "'${HACKDIR}'":' \
		-e 's:^ *\(#define COMPRESS\) .*:\1 "/bin/gzip":' \
		-e 's:^ *\(#define COMPRESS_EXTENSION\) .*:\1 ".gz":' \
		-e 's:^/\* \(#define DLB\) .*:\1:' \
		-e 's:^\(#[ \t]*define GRAPHIC_TOMBSTONE\):/\* \1 \*/:' \
		-e 's:/usr/games/lib/nethackdir:'${HACKDIR}':' \
		-e 's:^/\* \(#define VISION_TABLES\) .*:\1:' \
		config.h.orig >config.h || die
	rm config.h.orig

	mv unixconf.h unixconf.h.orig
	sed -e 's:^/\* \(#define LINUX\) .*:\1:' \
		-e 's:^/\* \(#define TIMED_DELAY\) .*:\1:' \
		-e 's:^/\* \(#define VAR_PLAYGROUND\) .*:\1 "'${VARDIR}'":' \
		unixconf.h.orig >unixconf.h || die
	rm unixconf.h.orig

	if use X; then
		cd ${S}
		mv include/config.h include/config.h.orig
		echo '#define X11_GRAPHICS' >> include/config.h
		srcs='$(WINTTYSRC) $(WINX11SRC)'
		objs='$(WINTTYOBJ) $(WINX11OBJ)'
		libs='$(WINTTYLIB) $(WINX11LIB)'
		vardatnd=''
		useld='#'
		if use qt; then
			echo '#define QT_GRAPHICS' >> include/config.h
			srcs=$srcs' $(WINQTSRC)'
			objs=$objs' $(WINQTOBJ)'
			libs=$libs' $(WINQTLIB)'
			useld=''
		fi
		if use gnome; then
			echo '#define GNOME_GRAPHICS' >> include/config.h
			srcs=$srcs' $(WINGNOMESRC)'
			objs=$objs' $(WINGNOMEOBJ)'
			libs=$libs' $(WINGNOMELIB)'
		fi
		cat include/config.h.orig >> include/config.h
		rm include/config.h.orig

		vardatnd=""
		if use X; then
			vardatnd="x11tiles pet_mark.xbm rip.xpm"
			if use gnome; then
				vardatnd="${vardatnd} mapbg.xpm"
			fi
		fi
		mv Makefile Makefile.orig
		sed -e 's:^\(VARDATND =\).*:\1 '"${vardatnd}"':' \
			Makefile.orig > Makefile
		rm Makefile.orig

		cd ${S}/src
		mv Makefile Makefile.orig
		sed -e 's:^\(WINSRC = \).*:\1 '"$srcs"':' \
			-e 's:^\(WINOBJ =\).*:\1 '"$objs"':' \
			-e 's:^\(WINLIB =\).*:\1 '"$libs"':' \
			-e 's:^\(LFLAGS =\).*:\1 -L/usr/X11R6/lib:' \
			-e 's:^#\(LD=.*\):'$useld'\1:' \
			-e 's:$(QTDIR):/usr/qt/2:' \
			-e "s:^\(GNOMEINC=.*\):\1 `gnome-config --cflags gnomeui`:" \
			-e 's:^\(WINQTOBJ =.*\) tile.o\(.*\):\1\2:' \
			-e 's:\(.*gnyesno.o\) tile.o\(.*\):\1\2:' \
			Makefile.orig >Makefile || die "Patching src/Makefile failed"
		rm Makefile.orig
	fi
}

src_compile() {
	make CC="gcc" \
	     CFLAGS="${CFLAGS} -fomit-frame-pointer -I../include" \
	     VARDATND="${vardatnd}" \
	     WINTTYLIB="-lncurses" \
	     WINX11LIB="-lXaw -lXmu -lXext -lXt -lXpm -lX11 -lm" || die
	cd util
	make recover
}

src_install () {
	myconf="PREFIX=${D}/usr
		GAMEDIR=${D}${HACKDIR}
	        VARDIR=${D}${VARDIR}
	        SHELLDIR=${D}/usr/bin"
	#make ${myconf} update || die
	make ${myconf} install || die
	touch ${D}${VARDIR}/save/.keep
	rmdir ${D}usr/bin/lib
	sed -e "s;/usr/games/lib/nethackdir;${HACKDIR};" \
		-e "s;HACKDIR/nethack;HACKDIR/jnethack;" \
		< ${S}/sys/unix/nethack.sh \
		> jnethack
	exeopts -m0755 -ogames -gbin
	exeinto /usr/bin
	doexe jnethack
	exeinto ${HACKDIR}
	doexe util/recover
	dodoc doc/*.txt doc/fixes* doc/*.doc
	doman doc/*.6

	# save old scores
	[ -d ${VARDIR} ] && rm ${D}${VARDIR}/{logfile,record}

	# Can be copied to ~/.jnethackrc to set options
	cp ${FILESDIR}/dot.jnethackrc ${S}

	if use X; then

		# install nethack fonts
		dodir ${HACKDIR}/fonts
		cd ${S}/win/X11
		bdftopcf -o nh10.pcf nh10.bdf || die "Converting fonts failed"
		bdftopcf -o ibm.pcf ibm.bdf || die "Converting fonts failed"
		cp *.pcf ${D}${HACKDIR}/fonts
		cd ${D}${HACKDIR}/fonts
		mkfontdir || die "The action mkfontdir ${D}${HACKDIR}/fonts failed"

		# copy nethack x application defaults
		cd ${S}/win/X11
		cp NetHack.ad NetHack.ad.orig
		sed -e 's:^!\(NetHack.tile_file.*\):\1:' \
			NetHack.ad.orig >NetHack.ad || die "Patching NetHack.ad for X failed"
		cp NetHack.ad NetHack
		insinto /etc/X11/app-defaults
		doins NetHack || die "Failed to install NetHack X app defaults"

		wintype="x11"
		wintypeall="x11"
		use qt && wintype="qt" && wintypeall="${wintypeall} qt"
		use gnome && wintype="gnome" && wintypeall="${wintypeall} gnome"
		cd ${S}
		mv dot.jnethackrc dot.jnethackrc.orig
		sed -e 's/^\(# Your windowtype choices are: .*\)/\1 '"${wintypeall}"'/' \
			-e 's/^\(OPTIONS=windowtype:\).*/\1'${wintype}'/' \
			dot.jnethackrc.orig >dot.jnethackrc || die "Patching dot.jnethackrc for windowtype failed"
	fi

	insinto ${HACKDIR}
	doins ${S}/dot.jnethackrc

	## Add this to /etc/.skel as well, thats the place for default configs
	cp ${S}/dot.jnethackrc ${S}/.jnethackrc
	dodir /etc/skel
	insinto /etc/skel
	doins ${S}/.jnethackrc
}

pkg_postinst () {
	einfo ">>> you may want to look at /etc/skel/.nethackrc for interesting options"
}
