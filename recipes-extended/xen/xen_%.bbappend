FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://fix-include-issue.patch"

PACKAGECONFIG_append = "xsm"
