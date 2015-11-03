# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

IO_V="v${PV}"

DESCRIPTION="Event-driven I/O server-side JavaScript environment based on V8"
HOMEPAGE="https://nodejs.org/"
SRC_URI="${SRC_URI}
    amd64? ( https://iojs.org/dist/${IO_V}/iojs-${IO_V}-linux-x64.tar.xz )
    x86? ( https://iojs.org/dist/${IO_V}/iojs-${IO_V}-linux-x86.tar.xz )"

LICENSE="Apache-1.1 Apache-2.0 BSD BSD-2 MIT"
SLOT="2"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/${A/.tar.xz}"
src_install() {
	declare NODE_HOME=/opt/node-${SLOT}

	dodir ${NODE_HOME%/*}

	mv ${S} "${ED}"${NODE_HOME} || die

	dodir /usr/bin

	cat <<-EOF >"$ED/usr/bin/node${SLOT}"
	#!/bin/bash
	exec ${NODE_HOME}/bin/node
	EOF

	fperms 0755 /usr/bin/node${SLOT}

	cat <<-EOF >"$ED/usr/bin/npm${SLOT}"
	#!/bin/bash
	exec ${NODE_HOME}/bin/npm
	EOF

	fperms 0755 /usr/bin/npm${SLOT}

}

