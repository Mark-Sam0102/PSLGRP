locals {
  # Context with subnet type tag
  context = {
    application_name = var.context.application_name
    environment_name = var.context.environment_name
    region           = var.context.region
    tags             = merge({ "subnet-type" = "private" }, var.context.tags)
  }
  default_routes = [
    {
      address_space = "0.0.0.0/0"
      network_type  = "ip"
      resource_id   = var.nat_gateway_id
      resource_type = "nat_gateway"
    }
  ]
  combined_routes = concat(local.default_routes, var.routes)
}

module "main" {

  source = "../base"

  context           = local.context
  vpc_id            = var.vpc_id
  availability_zone = var.availability_zone
  name              = var.name
  address_space     = var.address_space

}

# route internet traffic through a NAT Instance
module "route" {

  source = "../../route-table"

  context = var.context

  vpc_id  = var.vpc_id
  name    = "${var.name}-route"
  routes  = local.combined_routes
  subnets = [module.main.id]

}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
