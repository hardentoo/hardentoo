# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.5.5.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Generic programming library for generalised deriving"
HOMEPAGE="https://github.com/dreixel/generic-deriving"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=">=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.10
	test? ( >=dev-haskell/hspec-2 <dev-haskell/hspec-3 )
"

src_prepare() {
	default

	cabal_chdeps \
		'template-haskell >= 2.4 && < 2.13' 'template-haskell >= 2.4' \
		'template-haskell >= 2.4  && < 2.13' 'template-haskell >= 2.4'
}
