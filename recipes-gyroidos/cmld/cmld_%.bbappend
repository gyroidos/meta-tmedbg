FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

DEPENDS += " gcc-sanitizers "
IMAGE_INSTALL:append = " gcc-sanitizers "

# kirkstone does not include gcc sanitizers support for riscv64
DEPENDS:remove:riscv64 = "gcc-sanitizers"
DEPENDS:remove:beaglev-fire = "gcc-sanitizers"
IMAGE_INSTALL:remove:riscv64 = " gcc-sanitizers "
IMAGE_INSTALL:remove:beaglev-fire = " gcc-sanitizers "
