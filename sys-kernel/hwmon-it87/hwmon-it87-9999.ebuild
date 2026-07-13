# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs git-r3 linux-mod-r1 linux-info

DESCRIPTION="Dead but better out of tree it87 module"
HOMEPAGE="https://github.com/Acatorn/it87"
EGIT_REPO_URI="https://github.com/Acatorn/it87"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

CONFIG_CHECK="HWMON HWMON_VID !PPC !SENSORS_IT87"

pkg_setup() {
	linux-mod-r1_pkg_setup
}

src_compile() {
	local modlist=(
		it87=kernel/drivers/hwmon
	)
	linux-mod-r1_src_compile
}

src_install() {
	linux-mod-r1_src_install
}
