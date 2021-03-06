# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Matrix group messaging app"
HOMEPAGE="https://wiki.gnome.org/Apps/Fractal"
RESTRICT="network-sandbox"

inherit meson gnome2-utils xdg-utils

if [[ ${PV} == "9999" ]]; then
	inherit git-r3

	SRC_URI=""
	EGIT_REPO_URI="https://gitlab.gnome.org/world/fractal.git"
	EGIT_BRANCH="master"
else
	SRC_URI="https://gitlab.gnome.org/GNOME/${PN}/-/archive/${PV}/${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND=">=virtual/rust-1.31.1
	app-text/gspell
	dev-libs/glib
	dev-libs/openssl
	gui-libs/libhandy:1
	media-libs/gst-plugins-bad
	media-libs/gst-plugins-base
	media-libs/gstreamer
	media-libs/gstreamer-editing-services
	sys-apps/dbus
	x11-libs/cairo
	x11-libs/gdk-pixbuf
	x11-libs/gtk+:3
	x11-libs/gtksourceview:4
x11-libs/gtksourceview:4"
DEPEND="${RDEPEND}"
BDEPEND="dev-util/ninja
	dev-util/meson"

pkg_preinst() {
	gnome2_schemas_savelist
}

pkg_postinst() {
	gnome2_schemas_update
	xdg_icon_cache_update
}

pkg_postrm() {
	gnome2_schemas_update
	xdg_icon_cache_update
}
