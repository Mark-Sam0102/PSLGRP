# Generate a random string to keep names unique
resource "random_string" "random" {
  length  = 12
  special = false
  lower   = true
  upper   = false
}

locals {
  service_name       = random_string.random.result
  private_subnet_ids = var.private_subnet_ids
  vpc_id             = var.vpc_id
  product_version    = var.product_version
  instance_class     = var.instance_class
  allocated_storage  = var.allocated_storage
  multi_az           = var.multi_az
  deployment_id      = var.PIPOD_DEPLOYMENT_ID

  monitor_failed_db_login = "${local.deployment_id}-rds | Monitor failed database logins"
  monitor_db_cpu_usage    = "${local.deployment_id}-rds | Monitor database CPU utilization"

  rds_name            = var.rds_name
  username            = var.username
  deletion_protection = var.deletion_protection
  password            = random_string.password.result

  db_instance_address  = module.rds_mysql.address
  db_instance_endpoint = module.rds_mysql.endpoint
  db_instance_port     = module.rds_mysql.port
  db_instance_id       = module.rds_mysql.id
  db_instance_name     = module.rds_mysql.id

  primary_context = {
    application_name = var.application_name
    environment_name = var.environment_name
    region           = var.region
    tags = {
      "svc"         = local.service_name
      "owner"       = "pipod"
      "added_by"    = var.added_by
      "expire_date" = formatdate("DD MMM YYYY hh:mm ZZZ", time_offset.expire_date.rfc3339)
    }
  }
  availability_zones = ["a", "b"]
}

resource "time_offset" "expire_date" {
  offset_days = 2
}

module "resource-group" {
  source  = "../modules/services/resource-group/base"
  context = local.primary_context
  name    = "${var.application_name}-${var.environment_name}-${local.service_name}"
}