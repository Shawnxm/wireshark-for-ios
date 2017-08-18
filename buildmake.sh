#!/bin/bash

make -j4
make install


# remane for arm arch
mv $BUILD_DIR/lib/$STATIC_LIB_NAME $BUILD_DIR/lib/$STATIC_LIB_NAME_ARM

## build in terminal for i386 x86_64
##
## mkdir build
## ./configure --prefix=`pwd`/build --disable-shared
## make CC="$(xcrun --sdk iphonesimulator -f clang) -isysroot $(xcrun --sdk iphonesimulator --show-sdk-path) \
## -arch i386 -arch x86_64 -mios-simulator-version-min=7.0"
## make install
##
#
#SDKROOT=$(xcrun --sdk iphonesimulator --show-sdk-path)
#CC="$(xcrun --sdk iphonesimulator -f clang)"
#CXX="$(xcrun --sdk iphonesimulator -f clang++)"
#CFLAGS=" -isysroot $SDKROOT $ARCHS_IPHONE_SIMULATOR -mios-simulator-version-min=7.0"
#CXXFLAGS=$CFLAGS
#export CC CXX CFLAGS CXXFLAGS
#
#make distclean
#
#./configure \
#--prefix=$BUILD_DIR \
#--disable-shared
#
#make -j4
#make install
#
## remane for x86 arch
#mv $BUILD_DIR/lib/$STATIC_LIB_NAME $BUILD_DIR/lib/$STATIC_LIB_NAME_X86

# create universal static library
lipo -create $BUILD_DIR/lib/$STATIC_LIB_NAME_ARM $BUILD_DIR/lib/$STATIC_LIB_NAME_X86 \
-output $BUILD_DIR/lib/$STATIC_LIB_NAME

echo "************** Done **************"
lipo -info $BUILD_DIR/lib/$STATIC_LIB_NAME_ARM $BUILD_DIR/lib/$STATIC_LIB_NAME_X86 $BUILD_DIR/lib/$STATIC_LIB_NAME
