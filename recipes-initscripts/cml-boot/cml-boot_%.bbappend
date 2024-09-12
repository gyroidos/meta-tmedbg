SRC_URI += "\
	file://mnt_ext9pfs \
"
FILESEXTRAPATHS:prepend := "${THISDIR}/files:${THISDIR}/files:"

do_install:append () {
	bbwarn "Patching /init script to mount 9p file systems during early boot"

	sed -i '\|mount -o bind,nosuid,nodev,noexec /mnt/userdata /data|i mount -o remount,sync /mnt' ${D}/init

	sed -i '\|Starting Compartment Manager Daemon (cmld)|e cat ${TOPDIR}/../meta-tmedbg/recipes-initscripts/cml-boot/files/mnt_ext9pfs' ${D}/init

	bbwarn "Patching /init script to mount 9p file systems during boot"

	sed -i '\|exec /sbin/init > /dev/$LOGTTY 2>&1|e cat ${TOPDIR}/../meta-tmedbg/recipes-initscripts/cml-boot/files/mnt_ext9pfs_again' ${D}/init
	sed -i '\|exec /sbin/init > /dev/$LOGTTY 2>&1|e cat ${TOPDIR}/../meta-tmedbg/recipes-initscripts/cml-boot/files/mnt_ext9pfs_again' ${D}/init

	sed -i '/^export.*/i export ASAN_OPTIONS=log_path=/data/logs/asan.log:halt_on_error=0' ${D}/init
	sed -i 's/^cmld/LD_PRELOAD=libasan.so.5 cmld/' ${D}/init
	sed -i 's/^scd/LD_PRELOAD=libasan.so.5 scd/' ${D}/init

}
