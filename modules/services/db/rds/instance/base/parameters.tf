module "parameter_group" {

  source = "../../parameter-group"

  context    = var.context
  name       = "${var.name}-pg"
  family     = "${var.engine}${var.engine_version_family}"
  parameters = var.parameters

}
