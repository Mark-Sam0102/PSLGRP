module "main" {

  source = "../base"

  context = var.context

  name = var.name

  # Compute
  engine                = "oracle-${var.edition}"
  engine_version        = var.engine_version
  engine_version_family = local.engine_version_family
  instance_class        = var.instance_class
  multi_az              = var.multi_az

  # Storage
  allocated_storage = var.allocated_storage
  storage_type      = var.storage_type
  iops              = var.iops
  storage_encrypted = var.storage_encrypted

  # Autentication
  username = var.username
  password = var.password

  # Networking
  availability_zone = var.availability_zone
  subnets           = var.subnets
  security_groups   = var.security_groups

  # Configuration
  backup_retention_period = var.backup_retention_period
  skip_final_snapshot     = var.skip_final_snapshot
  replicate_source_db     = var.replicate_source_db
  snapshot_identifier     = var.snapshot_identifier
  deletion_protection     = var.deletion_protection
  parameters              = var.parameters

  # Licensing
  license_model = var.license_model
}


# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
