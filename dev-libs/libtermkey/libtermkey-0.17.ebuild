# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

inherit autotools eutils

DESCRIPTION="Recognises special keys (such as arrow and function keys), including "modified" keys like Ctrl-Left."
HOMEPAGE="http://www.leonerd.org.uk/code/libtermkey/"
SRC_URI="http://www.leonerd.org.uk/code/libtermkey/${P}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

src_prepare() {
    epatch "${FILESDIR}"/${P}-destdir.patch
}
