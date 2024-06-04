FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

DEPENDS += " gcc-sanitizers "
IMAGE_INSTALL:append = " gcc-sanitizers "
