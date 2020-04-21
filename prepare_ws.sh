#!/bin/sh

if [ -z "$1" ];then
	echo "No build directory given, exiting..."
	exit 1
fi

(cd "$1" && bitbake-layers add-layer ../meta-tmedbg)

for f in $1/conf/local.conf $1/conf/multiconfig/*.conf;do
	echo "Patching DISTRO in $f"
	sed -i 's/DISTRO = "poky"/DISTRO = "cml-debug"/' $f
	sed -i 's/DISTRO = "poky-tiny"/DISTRO = "cml-debug-tiny"/' $f
done
