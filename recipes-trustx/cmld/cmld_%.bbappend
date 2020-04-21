FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

#SRC_URI_append = ""

do_compile_prepend () {
	export DEVELOPMENT_BUILD=y
	export AGGRESSIVE_WARNINGS=y
	export SANITIZERS=n
}

DEPENDS += " gcc-sanitizers "
IMAGE_INSTALL_append += " gcc-sanitizers "
