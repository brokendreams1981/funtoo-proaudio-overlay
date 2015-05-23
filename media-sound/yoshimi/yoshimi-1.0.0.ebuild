# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit cmake-utils

DESCRIPTION="A software synthesizer for Linux, based on ZynAddSubFX"
HOMEPAGE="http://yoshimi.sourceforge.net"
RESTRICT="mirror"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
DEPEND=">=x11-libs/fltk-1.1.2:1[opengl]
	=sci-libs/fftw-3*
	>=media-sound/jack-audio-connection-kit-0.115.6
	media-libs/libsndfile
	>=dev-libs/mini-xml-2.5"

RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}/src"

pkg_postinst() {
	einfo "Banks are installed into"
	einfo "/usr/share/yoshimi/banks"
	einfo "Set above dir in Yoshimi > Settings > Bank root dir"
}
