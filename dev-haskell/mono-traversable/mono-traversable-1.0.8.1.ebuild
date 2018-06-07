# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.5.4.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Type classes for mapping, folding, and traversing monomorphic containers"
HOMEPAGE="https://github.com/snoyberg/mono-traversable#readme"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="amd64 x86"
IUSE=""

RESTRICT=test # broken against QC-2.10

RDEPEND="dev-haskell/hashable:=[profile?]
	>=dev-haskell/semigroups-0.10:=[profile?]
	>=dev-haskell/split-0.2:=[profile?]
	>=dev-haskell/text-0.11:=[profile?]
	>=dev-haskell/unordered-containers-0.2:=[profile?]
	>=dev-haskell/vector-0.10:=[profile?]
	>=dev-haskell/vector-algorithms-0.6:=[profile?]
	>=dev-lang/ghc-7.8.2:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.18.1.3
	test? ( dev-haskell/foldl
		dev-haskell/hspec
		dev-haskell/hunit
		dev-haskell/quickcheck )
"
