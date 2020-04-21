SRC_URI += "\
	file://mnt_ext9pfs \
"
FILESEXTRAPATHS_prepend := "${THISDIR}/files:${THISDIR}/files:"

do_install_append () {
	bbwarn "Patching /init script t mount 9p file systems during early boot"

	bbwarn "sed -i \$\| -f \"/data/cml/containers/00000000-0000-0000-0000-000000000000.conf\" |e cat ${TOPDIR}/../meta-tmedbg/recipes-initscripts/cml-boot/files/mnt_ext9pfs ${D}/init"
	sed -i '\| -f \"/data/cml/containers/00000000-0000-0000-0000-000000000000.conf\" |e cat ${TOPDIR}/../meta-tmedbg/recipes-initscripts/cml-boot/files/mnt_ext9pfs' ${D}/init
}
