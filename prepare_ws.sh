#!/bin/bash

BUILD_DIR="$1"

if [ -z "BUILD_DIR" ];then
	echo "No build directory given, exiting..."
	exit 1
fi

(cd "$1" && bitbake-layers add-layer $BUILD_DIR/../meta-tmedbg)

for f in  $BUILD_DIR/conf/local.conf $BUILD_DIR/../{meta-trustx,meta-trustx-intel}/conf/multiconfig/*.{conf,inc};do
	echo "Patching DISTRO in $f"
	sed -i 's/DISTRO = "gyroidos-core"/DISTRO = "cml-debug"/' $f
	sed -i 's/DISTRO = "gyroidos-cml"/DISTRO = "cml-debug-tiny"/' $f
done
