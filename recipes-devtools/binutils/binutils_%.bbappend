# To reduce size of initramfs drastically remove dependency here
# newer recipes do not use this variable at all but disable
# ld gold by fixed configure option

LDGOLD = ""
LDGOLD_ALTS = ""
