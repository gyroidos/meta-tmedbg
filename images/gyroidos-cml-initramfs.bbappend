EXTENDED_PACKAGES += " \
	gdb \
	valgrind \
"

PACKAGE_INSTALL += " \
	${@bb.utils.contains('DISTRO_FEATURES', 'tmedbg-extended', '${EXTENDED_PACKAGES}', '', d)} \
	bridge-utils \
	iproute2 \
	usbutils \
	bash \
	bash-completion \
	perl-module-file-basename \
	perl-module-file-glob \
	tcpdump \
	gcc-sanitizers \
	util-linux \
"
