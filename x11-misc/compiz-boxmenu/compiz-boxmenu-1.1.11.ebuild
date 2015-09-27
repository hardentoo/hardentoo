# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils

DESCRIPTION="desktop menu for compiz"
HOMEPAGE="https://github.com/ShadowKyogre/Compiz-Boxmenu"
SRC_URI="http://downloads.sourceforge.net/project/compizboxmenu/source%20snapshots/compiz-boxmenu_-_1.1.11.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
        unpack ${A}
        S=${WORKDIR}/${PN}
        cd "${S}"
}

src_compile() {
        cd "${S}"
        emake all
}

src_install() {
        emake DESTDIR="${D}" install || die "emake install failed"
}
