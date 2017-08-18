#!/bin/bash
# e.g. libmms http://sourceforge.net/projects/libmms/

# set -x

BUILD_DIR=`pwd`"/build"
STATIC_LIB_NAME="libwireshark.a"
STATIC_LIB_NAME_ARM="libwireshark.a.arm"
STATIC_LIB_NAME_X86="libwireshark.a.x86"

#ARCHS_IPHONE_OS="-arch armv7 -arch armv7s -arch arm64"
ARCHS_IPHONE_OS="-arch arm64"
ARCHS_IPHONE_SIMULATOR="-arch i386 -arch x86_64"

mkdir -p $BUILD_DIR

# build in terminal for armv7 armv7s arm64
#
# mkdir build
# ./configure --host=arm-apple-darwin --prefix=`pwd`/build --disable-shared
# make CC="$(xcrun --sdk iphoneos -f clang) -isysroot $(xcrun --sdk iphoneos --show-sdk-path) \
# -arch armv7 -arch armv7s -arch arm64 -miphoneos-version-min=7.0"
# make install
#

SDKROOT=$(xcrun --sdk iphoneos --show-sdk-path)
CC="$(xcrun --sdk iphoneos -f clang)"
CXX="$(xcrun --sdk iphoneos -f clang++)"
CFLAGS="-isysroot $SDKROOT $ARCHS_IPHONE_OS -miphoneos-version-min=7.0"
CXXFLAGS=$CFLAGS
export CC CXX CFLAGS CXXFLAGS

make distclean

./configure \
--host=arm-apple-darwin \
--prefix=$BUILD_DIR \
--enable-static \
--disable-shared \
--disable-wireshark \
--with-zlib=no \
--with-pcap=no


