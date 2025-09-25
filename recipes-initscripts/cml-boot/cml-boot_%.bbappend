FILESEXTRAPATHS:prepend := "${THISDIR}/files:${THISDIR}/files:"
SRC_URI += "\
	file://61-export-asan-options.fragment \
	file://90-start-cmld.fragment \
"

do_install:append () {
	sed -i '\|mount -o bind,nosuid,nodev,noexec /mnt/userdata /data|i mount -o remount,sync /mnt' ${D}/init
}
