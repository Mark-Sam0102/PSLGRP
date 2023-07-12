locals {
  # Context with subnet type tag
  context = {
    application_name = var.context.application_name
    environment_name = var.context.environment_name
    region           = var.context.region
    tags             = merge({ "subnet-type" = "public" }, var.context.tags)
  }
  default_routes = [
    {
      address_space = "0.0.0.0/0"
      network_type  = "ip"
      resource_id   = var.igw_id
      resource_type = "gateway"
    }
  ]
  combined_routes = concat(local.default_routes, var.routes)
}

module "main" {

  source = "../base"

  context           = local.context
  vpc_id            = var.vpc_id
  name              = var.name
  address_space     = var.address_space
  availability_zone = var.availability_zone
  map_public_ip     = var.map_public_ip

}

module "public_eip" {

  source  = "../../eip/base"
  context = var.context
  name    = "${var.name}-nat-ip"

}

module "nat_gateway" {

  source = "../../nat-gateway/base"

  context           = var.context
  subnet_id         = module.main.id
  name              = "${var.name}-nat"
  connectivity_type = "public"
  eip_id            = module.public_eip.id

}

# route internet traffic through an Internet Gateway
module "route" {

  source = "../../route-table"

  context = var.context

  vpc_id  = var.vpc_id
  name    = "${var.name}-route"
  routes  = local.combined_routes
  subnets = [module.main.id]

}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
