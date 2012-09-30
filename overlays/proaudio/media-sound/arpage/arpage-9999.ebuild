# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit autotools-utils subversion

DESCRIPTION="MIDI Arpeggiator w/ JACK Tempo Sync, includes Zonage MIDI splitter/manipulator"
HOMEPAGE="http://sourceforge.net/projects/arpage/"
ESVN_REPO_URI="https://arpage.svn.sourceforge.net/svnroot/arpage/trunk"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND=">=dev-cpp/gtkmm-2.12:2.4
	dev-cpp/libxmlpp:2.6
	>=media-sound/jack-audio-connection-kit-0.105.0"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS=(AUTHORS ChangeLog README)

PATCHES=("${FILESDIR}"/${PN}-0.3.3-doc.patch)

AUTOTOOLS_AUTORECONF=1
