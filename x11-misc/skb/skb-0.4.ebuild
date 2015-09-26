# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/netwmpager/netwmpager-1.11-r1.ebuild,v 1.6 2011/12/13 22:48:29 ago Exp $

inherit eutils

DESCRIPTION="Simple keyboard layout indicator."
HOMEPAGE="http://freecode.com/projects/skb"
SRC_URI="http://plhk.ru/static/skb/skb-0.4.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~ppc ~ppc64 x86 ~x86-fbsd"
IUSE=""

src_install() {
        emake DESTDIR="${D}" install || die "emake install failed"
}
