#!/bin/bash

# Grab the MACHINE from the environment; otherwise, set it to a sane default
export MACHINE="${MACHINE-qemux86-64}"

# What to build
BUILD_TARGETS="
    xen-image-minimal \
"

if [ "$MACHINE" == "qemux86-64" ]; then
    BUILD_TARGETS="$BUILD_TARGETS xen-guest-image-minimal "
fi

die() {
    echo "$*" >&2
    exit 1
}

rm -f build/conf/bblayers.conf || die "failed to nuke bblayers.conf"
rm -f build/conf/local.conf || die "failed to nuke local.conf"

./scripts/containerize.sh bitbake -k ${BUILD_TARGETS} || die "failed to build"

