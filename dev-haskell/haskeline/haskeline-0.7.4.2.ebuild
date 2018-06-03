# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.5.5.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="A command-line interface for user input, written in Haskell"
HOMEPAGE="https://github.com/judah/haskeline"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
# keep in sync with ghc-8.4.2
KEYWORDS="~alpha amd64 x86 ~amd64-linux ~x86-linux"
IUSE="+terminfo"

RDEPEND=">=dev-haskell/stm-2.4:=[profile?]
	>=dev-lang/ghc-7.8.2:=
	terminfo? ( >=dev-haskell/terminfo-0.3.1.3:=[profile?] <dev-haskell/terminfo-0.5:=[profile?] )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.18.1.3
"

CABAL_CORE_LIB_GHC_PV="PM:8.4.2_rc1 PM:8.4.2 PM:8.4.3 PM:9999"

src_prepare() {
	default

	cabal_chdeps \
		'stm >= 2.4 && < 2.5' 'stm >= 2.4'
}

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag terminfo terminfo)
}
