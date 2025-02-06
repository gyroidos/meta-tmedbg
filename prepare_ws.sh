#!/bin/bash

set -e

BUILD_DIR="$(readlink -m $1)"

if ! [ -d "$BUILD_DIR" ];then
    echo "Specified Build directory $BUILD_DIR does not exist, exiting..."
    exit 1
fi

(cd "$1" && bitbake-layers add-layer $BUILD_DIR/../meta-tmedbg)

for f in  $BUILD_DIR/conf/local.conf $BUILD_DIR/../{meta-gyroidos,meta-gyroidos-intel,meta-gyroidos-nxp,meta-gyroidos-rpi}/conf/multiconfig/*.{conf,inc};do
	echo "Patching DISTRO in $f"
	sed -i 's/DISTRO = "core-ref"/DISTRO = "cml-debug"/' $f || true
	sed -i 's/DISTRO = "cml-base"/DISTRO = "cml-debug-tiny"/' $f || true
done
