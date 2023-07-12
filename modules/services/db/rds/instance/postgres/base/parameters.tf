locals {
  engine_version_family_9_6    = length(regexall("9\\.6.*", var.engine_version)) > 0
  engine_version_family_others = regex("^\\d*", var.engine_version)
  engine_version_family        = local.engine_version_family_9_6 ? "9.6" : local.engine_version_family_others
}
