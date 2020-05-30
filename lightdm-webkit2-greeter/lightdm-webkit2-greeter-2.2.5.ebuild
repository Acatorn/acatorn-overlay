# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Web Greeter for LightDM"
HOMEPAGE="https://github.com/antergos/web-greeter"
MY_P="${P/lightdm-webkit2-greeter/web-greeter}"
MY_PN="${PN/lightdm-webkit2-greeter/web-greeter}"
S="${WORKDIR}/${MY_P}"
SRC_URI="https://github.com/Antergos/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="x11-misc/lightdm
		x11-libs/gtk+
		net-libs/webkit-gtk
		dev-libs/dbus-glib"


RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	BUILD_DIR=${S}/build
	meson_src_configure
}
