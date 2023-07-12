
module "subnet_group" {

  source = "../../subnet-group"

  context = var.context
  name    = "${var.name}-snets"
  subnets = var.subnets

}
