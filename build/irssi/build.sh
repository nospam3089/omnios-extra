#!/usr/bin/bash
#
# {{{ CDDL HEADER
#
# This file and its contents are supplied under the terms of the
# Common Development and Distribution License ("CDDL"), version 1.0.
# You may only use this file in accordance with the terms of version
# 1.0 of the CDDL.
#
# A full copy of the text of the CDDL should have accompanied this
# source. A copy of the CDDL is also available via the Internet at
# http://www.illumos.org/license/CDDL.
# }}}
#
# Copyright 2022 OmniOS Community Edition (OmniOSce) Association.

. ../../lib/build.sh

PROG=irssi
VER=1.4.1
PKG=ooce/network/irssi
SUMMARY="Irssi"
DESC="Text-mode modular chat client"

OPREFIX=$PREFIX
PREFIX+="/$PROG"

set_arch 64

XFORM_ARGS="
    -DPREFIX=${PREFIX#/}
    -DOPREFIX=${OPREFIX#/}
    -DPROG=$PROG
    -DPKGROOT=$PROG
"

init
download_source $PROG $PROG $VER
patch_source
prep_build
build -ctf
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:fdm=marker
