# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="An all-in-one solution that provides many tools needed to use any Arduino compatible board and platform from command line or machine interfaces"
HOMEPAGE="https://github.com/arduino/arduino-cli"
SRC_URI="https://github.com/arduino/${PN:0:11}/releases/download/${PV}/${PN:0:11}_${PV}_Linux_64bit.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"

S="${WORKDIR}"

src_install() {
	dobin arduino-cli
}
