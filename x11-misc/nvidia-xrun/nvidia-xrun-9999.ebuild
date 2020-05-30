# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils git-r3

DESCRIPTION="Script to run dedicated X server with discrete nvidia graphics"
HOMEPAGE="https://github.com/Acatorn/nvidia-xrun"
EGIT_REPO_URI="https://github.com/Acatorn/nvidia-xrun.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="media-libs/mesa
		sys-power/bbswitch
		x11-apps/xinit
		x11-base/xorg-server[xorg]
		x11-drivers/nvidia-drivers[X,driver]
		x11-apps/xrandr"

src_install() {
	dobin bin/nvidia-xrun
	insinto /etc/X11
	doins -r X11/*
	insinto /etc/default
	doins -r default/*
	insinto /etc/modules-load.d
	doins -r modules-load.d/*
	insinto /etc/modprobe.d
	doins -r modprobe.d/*
}

pkg_postinst() {
	if test -f /etc/modprobe.d/bbswitch.conf ; then
		rm /etc/modprobe.d/bbswitch.conf
		CFGFILE=$(ls -a /etc/modprobe.d/ | grep _bbswitch.conf)
		mv /etc/modprobe.d/$CFGFILE /etc/modprobe.d/bbswitch.conf
	fi
}

