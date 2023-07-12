resource "random_string" "password" {
  length  = 10
  special = true
  lower   = true
  upper   = true
  #AllowedPattern: "^[a-zA-Z0-9]*$
  override_special = "/@"
}


module "rds_mysql" {

  source = "../modules/services/db/rds/instance/mysql/base"

  context = local.primary_context

  name                = local.rds_name
  engine_version      = local.product_version
  username            = local.username
  password            = random_string.password.result
  multi_az            = local.multi_az
  allocated_storage   = local.allocated_storage
  subnets             = local.private_subnet_ids
  deletion_protection = local.deletion_protection

  parameters = {
    "character_set_server" = "utf8",
    "character_set_client" = "utf8"
  }

}
