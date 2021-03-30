SRC_URI += "\
	file://mnt_ext9pfs \
"
FILESEXTRAPATHS_prepend := "${THISDIR}/files:${THISDIR}/files:"

do_install_append () {
	bbwarn "Patching /init script to mount 9p file systems during early boot"

	sed -i '\|if device.cert is not present, start scd to initialize device|e cat ${TOPDIR}/../meta-tmedbg/recipes-initscripts/cml-boot/files/mnt_ext9pfs' ${D}/init

	sed -i '/^export.*/i export ASAN_OPTIONS=log_path=/data/logs/asan.log:halt_on_error=0' ${D}/init
	sed -i 's/^cmld/LD_PRELOAD=libasan.so.5 cmld/' ${D}/init
	sed -i 's/^scd/LD_PRELOAD=libasan.so.5 scd/' ${D}/init

}
