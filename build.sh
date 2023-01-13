#!/bin/bash

set -e

rm -rf build

PACKAGE_NAME=dhcp-option-6rd-reporter
PACKAGE_VERSION=0.0.1
PACKAGE_RELEASE=1
ARCH=mips

mkdir -p build/DEBIAN
cp -r debian/* build/DEBIAN
cp -r etc build/etc

sed \
	-e "s/PACKAGE_VERSION/$PACKAGE_VERSION/g" \
	-e "s/PACKAGE_RELEASE/$PACKAGE_RELEASE/g" \
	-e "s/PACKAGE_ARCH/$ARCH/g" \
	debian/control \
	| tee build/DEBIAN/control

dpkg-deb -b -Z gzip build

mv build.deb ${PACKAGE_NAME}-${PACKAGE_VERSION}-${PACKAGE_RELEASE}.deb
