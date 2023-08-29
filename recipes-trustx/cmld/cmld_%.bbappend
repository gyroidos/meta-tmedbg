FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

EXTRA_OEMAKE += " SANITIZERS=y AGGRESSIVE_WARNINGS=y DEVELOPMENT_BUILD=y"

DEPENDS += " gcc-sanitizers "
IMAGE_INSTALL:append = " gcc-sanitizers "
