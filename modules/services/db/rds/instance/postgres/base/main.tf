module "main" {

  source = "../../base"

  context = var.context

  name    = var.name
  db_name = var.db_name

  # Compute
  engine                = "postgres"
  engine_version        = var.engine_version
  engine_version_family = local.engine_version_family
  instance_class        = var.instance_class
  multi_az              = var.multi_az

  # Storage
  allocated_storage = var.allocated_storage
  storage_type      = var.storage_type
  iops              = var.iops

  # Autentication
  username = var.username
  password = var.password

  # Networking
  availability_zone = var.availability_zone
  subnets           = var.subnets
  security_groups   = var.security_groups

  # Configuration
  parameters              = var.parameters
  backup_retention_period = var.backup_retention_period
  skip_final_snapshot     = var.skip_final_snapshot
  deletion_protection     = var.deletion_protection

}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
