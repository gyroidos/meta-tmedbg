SRC_URI += " \
	file://debugging.cfg \
"
FILESEXTRAPATHS:prepend := "${THISDIR}/generic:"

# Contribute nokaslr to the composable kernel command line owned by
# meta-gyroidos (see linux-gyroidos.inc:GYROIDOS_KERNEL_CMDLINE).
# Appending to the shared bitbake variable keeps every layer's contribution.
GYROIDOS_KERNEL_CMDLINE += "nokaslr"
