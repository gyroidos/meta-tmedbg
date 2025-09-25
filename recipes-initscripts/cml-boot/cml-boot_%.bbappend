FILESEXTRAPATHS:prepend := "${THISDIR}/files:${THISDIR}/files:"

do_install:append () {
	sed -i '\|mount -o bind,nosuid,nodev,noexec /mnt/userdata /data|i mount -o remount,sync /mnt' ${D}/init

	sed -i '/^export.*/i export ASAN_OPTIONS=log_path=/data/logs/asan.log:halt_on_error=0' ${D}/init
	sed -i 's/^cmld/LD_PRELOAD=libasan.so.5 cmld/' ${D}/init
	sed -i 's/^scd/LD_PRELOAD=libasan.so.5 scd/' ${D}/init

}
