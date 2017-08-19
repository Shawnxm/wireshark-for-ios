
readonly MIN_IOS_VERSION="10.3"
#readonly ARCHS=(armv7 armv7s arm64 i386 x86_64)
readonly ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly WORK_DIR="${ROOT_DIR}/work"
readonly LOGFILE="${ROOT_DIR}/build.log"

readonly LIPO="$(xcrun --sdk iphoneos -f lipo)"

readonly IPHONEOS_CC="$(xcrun --sdk iphoneos -f clang)"
readonly IPHONEOS_CXX="$(xcrun --sdk iphoneos -f clang++)"
readonly IPHONEOS_SDK="$(xcrun --sdk iphoneos --show-sdk-path)"
#readonly IPHONEOS_CFLAGS="-isysroot $IPHONEOS_SDK"
readonly IPHONEOS_CFLAGS="-isysroot $IPHONEOS_SDK -miphoneos-version-min=$MIN_IOS_VERSION -fembed-bitcode"


DEVROOT="/Applications/Xcode.app/Contents/Developer"
SDK_VERSION="10.3"
MIN_VERSION="10.3"

IPHONEOS_PLATFORM="${DEVROOT}/Platforms/iPhoneOS.platform"
IPHONEOS_SDK="${IPHONEOS_PLATFORM}/Developer/SDKs/iPhoneOS${SDK_VERSION}.sdk"
IPHONEOS_GCC="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang"


export SDKROOT="$DEVROOT/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS$SDK_VERSION.sdk"
export CFLAGS="-arch arm64  $IPHONEOS_CFLAGS"
  
export CPPFLAGS="-I${PREFIX}/include   $CFLAGS"
#export LDFLAGS="-L${PREFIX}/lib  -lffi $CFLAGS"
export CXX="/Applications/Xcode.app/Contents/Developer/usr/bin/g++"
export CC="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc"

# [ ! -d "${PREFIX}" ]
./configure --prefix="${PREFIX}" \
--build="x86_64-apple-darwin16.7.0" \
--host="arm-apple-darwin" \
--enable-static \
--disable-shared \
--disable-wireshark \
--with-zlib=no \
--with-pcap=no

#./configure --disable-wireshark --with-zlib=no --disable-shared --build=x86_64-apple-darwin --host=aarch64-apple-darwin --target=aarch64-apple-darwin CFLAGS="-arch arm64 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS10.3.sdk" CXXFLAGS="-arch arm64-apple-darwin -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS10.3.sdk" LDFLAGS="-L." CC="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc" CXX="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++"
