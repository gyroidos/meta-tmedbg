#!/bin/bash

set -e

BUILD_DIR="$(readlink -m $1)"

if ! [ -d "$BUILD_DIR" ];then
    echo "Specified Build directory $BUILD_DIR does not exist, exiting..."
    exit 1
fi

(cd "$1" && bitbake-layers add-layer $BUILD_DIR/../meta-tmedbg)

for f in  $BUILD_DIR/conf/local.conf $BUILD_DIR/../{meta-trustx,meta-trustx-intel}/conf/multiconfig/*.{conf,inc};do
	echo "Patching DISTRO in $f"
	sed -i 's/DISTRO = "gyroidos-core"/DISTRO = "cml-debug"/' $f
	sed -i 's/DISTRO = "gyroidos-cml"/DISTRO = "cml-debug-tiny"/' $f
done
