
module "subnet_public" {

  source = "../../subnet/public"

  context = var.context

  vpc_id            = var.vpc_id
  name              = "snet-public-${var.availability_zone}"
  availability_zone = "${var.context.region}${var.availability_zone}"
  address_space     = var.public_address_space
  igw_id            = var.igw_id
  routes            = var.public_routes

}


module "subnet_private" {

  source = "../../subnet/private"

  context = var.context

  vpc_id            = var.vpc_id
  name              = "snet-private-${var.availability_zone}"
  availability_zone = "${var.context.region}${var.availability_zone}"
  address_space     = var.private_address_space
  nat_gateway_id    = module.subnet_public.nat_gateway_id
  routes            = var.private_routes

}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
