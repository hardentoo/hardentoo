# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit autotools eutils systemd

DESCRIPTION="BitTorrent Client using libtorrent"
HOMEPAGE="https://rakshasa.github.io/rtorrent/"
SRC_URI="http://rtorrent.net/downloads/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~amd64-linux ~arm ~arm-linux ~hppa ~ia64 ~ppc ~ppc-macos ~ppc64 ~sparc ~sparc-solaris ~x64-macos ~x64-solaris ~x86 ~x86-linux ~x86-macos"
IUSE="daemon debug ipv6 selinux test xmlrpc"

COMMON_DEPEND="~net-libs/libtorrent-0.13.${PV##*.}
	>=dev-libs/libsigc++-2.2.2:2
	>=net-misc/curl-7.19.1
	sys-libs/ncurses:0=
	xmlrpc? ( dev-libs/xmlrpc-c )"
RDEPEND="${COMMON_DEPEND}
	daemon? ( app-misc/screen )
	selinux? ( sec-policy/selinux-rtorrent )
"
DEPEND="${COMMON_DEPEND}
	dev-util/cppunit
	virtual/pkgconfig"

DOCS=( doc/rtorrent.rc )

src_prepare() {
	# bug #358271
	epatch \
		"${FILESDIR}"/${PN}-0.9.1-ncurses.patch \
		"${FILESDIR}"/${PN}-0.9.4-tinfo.patch

	# https://github.com/rakshasa/rtorrent/issues/332
	cp "${FILESDIR}"/rtorrent.1 "${S}"/doc/ || die

	epatch "${FILESDIR}"/${PN}-0.9.2-canvas-fix.patch

	eautoreconf
}

src_configure() {
	# configure needs bash or script bombs out on some null shift, bug #291229
	CONFIG_SHELL=${BASH} econf \
		--disable-dependency-tracking \
		$(use_enable debug) \
		$(use_enable ipv6) \
		$(use_with xmlrpc xmlrpc-c)
}

src_install() {
	default
	doman doc/rtorrent.1

	if use daemon; then
		newinitd "${FILESDIR}/rtorrentd.init" rtorrentd
		newconfd "${FILESDIR}/rtorrentd.conf" rtorrentd
		systemd_newunit "${FILESDIR}/rtorrentd_at.service" "rtorrentd@.service"
	fi
}

pkg_postinst() {
	elog "rtorrent colors patch"
	elog "Set colors using the options below in .rtorrent.rc:"
	elog "Options: done_fg_color, done_bg_color, active_fg_color, active_bg_color"
	elog "Colors: 0 = black, 1 = red, 2 = green, 3 = yellow, 4 = blue,"
	elog "5 = magenta, 6 = cyan and 7 = white"
	elog "Example: done_fg_color = 1"
}
