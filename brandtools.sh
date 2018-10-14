#!/bin/sh

set -e
set -u

buildtools_version=28.0.3

bintools="aapt
	aapt2
	aarch64-linux-android-ld
	aidl
	arm-linux-androideabi-ld
	bcc_compat
	dexdump
	i686-linux-android-ld
	llvm-rs-cc
	mipsel-linux-android-ld
	split-select
	x86_64-linux-android-ld
	zipalign
"

for tool in $bintools; do
	brandelf -t linux "${ANDROID_SDK_HOME}/build-tools/${buildtools_version}/${tool}"
done
