# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.5.5.9999
#hackport: flags: +small_base

CABAL_FEATURES="test-suite"
inherit haskell-cabal

DESCRIPTION="Happy is a parser generator for Haskell"
HOMEPAGE="https://www.haskell.org/happy/"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~alpha amd64 ~ia64 ~ppc ~ppc64 ~sparc x86"
IUSE=""

RDEPEND=">=dev-haskell/mtl-2.2.1:=
	>=dev-lang/ghc-7.6.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.16.0 <dev-haskell/cabal-2.4
"

src_configure() {
	haskell-cabal_src_configure \
		--flag=small_base
}
