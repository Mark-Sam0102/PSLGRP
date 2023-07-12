resource "random_string" "password" {
  length  = 16
  special = false
  lower   = true
  upper   = true
}

module "sqlserver" {

  source = "../modules/services/db/rds/instance/sqlserver"

  context = local.primary_context

  name                = local.rds_name
  edition             = "web"
  engine_version      = local.engine_version
  username            = local.username
  password            = random_string.password.result
  instance_class      = local.instance_class
  subnets             = local.private_subnet_ids
  allocated_storage   = local.allocated_storage
  deletion_protection = false
}