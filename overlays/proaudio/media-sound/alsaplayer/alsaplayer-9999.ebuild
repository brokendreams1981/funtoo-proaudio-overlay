# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit eutils git flag-o-matic autotools

DESCRIPTION="Media player primarily utilising ALSA"
HOMEPAGE="http://www.alsaplayer.org/"
EGIT_REPO_URI="git://github.com/alsaplayer/alsaplayer.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="alsa doc esd flac gtk jack mad mikmod nas nls ogg opengl oss vorbis systray xosd"

S=${WORKDIR}/${PN}

RDEPEND="media-libs/libsndfile
	alsa? ( media-libs/alsa-lib )
	mad? ( media-libs/libmad )
	esd? ( media-sound/esound )
	flac? ( media-libs/flac )
	jack? ( >=media-sound/jack-audio-connection-kit-0.80.0 )
	mikmod? ( >=media-libs/libmikmod-3.1.10 )
	nas? ( media-libs/nas )
	ogg? ( media-libs/libogg )
	opengl? ( virtual/opengl )
	vorbis? ( media-libs/libvorbis )
	xosd? ( x11-libs/xosd )"

DEPEND="${RDEPEND}
	>=dev-libs/glib-2.10.1
	dev-util/pkgconfig
	doc? ( app-doc/doxygen )
	nls? ( sys-devel/gettext )
	gtk? ( >=x11-libs/gtk+-2.8 )
	systray? ( >=x11-libs/gtk+-2.10 )"

src_prepare() {
	cd ${S}

	./bootstrap || die "bootstrap failed"
	eautoreconf || die "eautoreconf failed"
}

src_configure() {
	use xosd ||
		export ac_cv_lib_xosd_xosd_create="no"

	use doc ||
		export ac_cv_prog_HAVE_DOXYGEN="false"

	econf \
		$(use_enable esd) \
		$(use_enable flac) \
		$(use_enable jack) \
		$(use_enable mad) \
		$(use_enable mikmod) \
		$(use_enable nas) \
		$(use_enable opengl) \
		$(use_enable oss) \
		$(use_enable nls) \
		$(use_enable sparc) \
		$(use_enable vorbis oggvorbis) \
		$(use_enable gtk gtk2) \
		$(use_enable systray) \
		${myconf} \
		--disable-sgi \
		--disable-dependency-tracking \
		|| die "econf failed"
}

src_compile() {
	emake || die "make failed"
}

src_install() {
	emake DESTDIR="${D}" docdir="${D}/usr/share/doc/${PN}" install \
		|| die "make install failed"
	dodoc AUTHORS ChangeLog README TODO
	dodoc docs/wishlist.txt
}
