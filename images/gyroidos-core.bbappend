PACKAGE_INSTALL += " \
	gdb \
	valgrind \
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

# valgrind release included in kirkstone does not support riscv64
# remove this when we move to scarthgap"
PACKAGE_INSTALL:remove:riscv64 = "valgrind"

# kirkstone does not include gcc sanitizers support for riscv64
# remove this when we move to scarthgap"
PACKAGE_INSTALL:remove:riscv64 = "gcc-sanitizers"
