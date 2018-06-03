# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.5.5.9999
#hackport: flags: -bundled-binary-generic

CABAL_FEATURES="lib profile test-suite"
CABAL_FEATURES+=" nocabaldep" # in case installed Cabal is broken
inherit haskell-cabal

MY_PN="Cabal"
MY_P="${MY_PN}-${PV}"

PV1=2.2.0.1
MY_P1="${MY_PN}-${PV1}"

DESCRIPTION="A framework for packaging Haskell software"
HOMEPAGE="http://www.haskell.org/cabal/"
SRC_URI="mirror://hackage/packages/archive/${MY_PN}/${PV1}/${MY_P1}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"

KEYWORDS="~alpha amd64 ~ia64 ~ppc ~ppc64 ~sparc x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~x86-solaris"
IUSE=""

RESTRICT=test # circular dependencies

RDEPEND=">=dev-haskell/mtl-2.1:=[profile?] <dev-haskell/mtl-2.3:=[profile?]
	>=dev-haskell/parsec-3.1.13.0:=[profile?] <dev-haskell/parsec-3.2:=[profile?]
	>=dev-haskell/text-1.2.3.0:=[profile?] <dev-haskell/text-1.3:=[profile?]
	>=dev-lang/ghc-7.8.2:=
"
DEPEND="${RDEPEND}"

	# test? ( >=dev-haskell/base-compat-0.9.3 <dev-haskell/base-compat-0.10
	# 	>=dev-haskell/base-orphans-0.6 <dev-haskell/base-orphans-0.7
	# 	>=dev-haskell/diff-0.3.4 <dev-haskell/diff-0.4
	# 	>=dev-haskell/integer-logarithms-1.0.2 <dev-haskell/integer-logarithms-1.1
	# 	>=dev-haskell/optparse-applicative-0.13.2.0 <dev-haskell/optparse-applicative-0.15
	# 	>=dev-haskell/quickcheck-2.11.3 <dev-haskell/quickcheck-2.12
	# 	dev-haskell/tagged
	# 	>=dev-haskell/tar-0.5.0.3 <dev-haskell/tar-0.6
	# 	>=dev-haskell/tasty-1.0
	# 	>=dev-haskell/tasty-golden-2.3.1.1 <dev-haskell/tasty-golden-2.4
	# 	dev-haskell/tasty-hunit
	# 	dev-haskell/tasty-quickcheck
	# 	>=dev-haskell/tree-diff-0.0.1 <dev-haskell/tree-diff-0.1 )

CABAL_CORE_LIB_GHC_PV="PM:8.4.2_rc1 PM:8.4.2 PM:8.4.3"

PATCHES=("${FILESDIR}"/${PN}-2.0.0.2-no-bootstrap.patch)

S="${WORKDIR}/${MY_P1}"

src_prepare() {
	default

	cabal_chdeps \
		'tasty >= 1.0 && < 1.1' 'tasty >= 1.0'

	cabal_chdeps \
		'unix  >= 2.5.1 && < 2.8' 'unix >= 2.5.1'

}

src_configure() {
	haskell-cabal_src_configure \
		--flag=-bundled-binary-generic
}

CABAL_CORE_LIB_GHC_PV="PM:8.4.2_rc1 PM:8.4.2 PM:8.4.3 PM:9999"
