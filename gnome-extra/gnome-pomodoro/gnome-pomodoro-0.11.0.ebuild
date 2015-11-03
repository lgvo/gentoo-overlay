# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Pomodoro time management utility for GNOME"
HOMEPAGE="http://gnomepomodoro.org"
VALA_MIN_API_VERSION=0.26
VALA_USE_DEPEND="vapigen"

inherit gnome2 vala

SRC_URI="https://github.com/codito/gnome-pomodoro/archive/${PV}.zip -> ${P}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86 ~arm"


RDEPEND=">=gnome-base/gnome-common-3.14
    >=sys-apps/dbus-1.8.16
    >=dev-libs/dbus-glib-0.102
    >=gnome-base/gnome-shell-3.16
    >=dev-libs/gobject-introspection-1.44.0
    >=dev-libs/gobject-introspection-common-1.44.0
    >=media-fonts/droid-113"

DEPEND="${RDEPEND}
    >=gnome-base/gnome-common-3.14
    >=dev-util/intltool-0.50.2
    >=dev-lang/vala-0.26.2"

src_prepare() {
    vala_src_prepare
}

src_configure() {
	${S}/autogen.sh --prefix=/usr --datadir=/usr/share 
}

