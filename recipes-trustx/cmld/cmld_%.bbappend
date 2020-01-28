FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = "\
	file://tme-dbgflags.patch \
"

DEPENDS += " gcc-sanitizers "
IMAGE_INSTALL_append += " gcc-sanitizers "
