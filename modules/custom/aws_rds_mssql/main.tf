# Generate a random string to keep names unique
resource "random_string" "random" {
  length  = 8
  special = false
  lower   = true
  upper   = false
}
locals {
  vpc_id = var.vpc_id
  private_subnet_ids = var.private_subnet_ids
  service_name         = random_string.random.result
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  allocated_storage    = var.allocated_storage
  rds_name             = var.rds_name
  username             = "root"
  password             = random_string.password.result
  db_instance_address  = module.sqlserver.address
  db_instance_endpoint = module.sqlserver.endpoint
  db_instance_port     = module.sqlserver.port
  primary_context = {
    application_name = var.application_name
    environment_name = var.environment_name
    region           = var.region
    tags             = var.tags
  }
  availability_zones = ["a", "b"]
}


resource "time_offset" "expire_date" {
  offset_days = 2
}

module "resource-group" {

  source = "../modules/services/resource-group/base"

  context = local.primary_context

  name = "${var.application_name}-${var.environment_name}-${local.service_name}"

}
