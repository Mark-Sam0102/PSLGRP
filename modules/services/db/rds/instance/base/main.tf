resource "aws_db_instance" "main" {

  identifier = var.name
  db_name    = var.db_name

  # Compute
  engine         = var.engine
  engine_version = var.engine_version
  instance_class = var.instance_class
  multi_az       = var.multi_az

  # Storage
  allocated_storage = var.allocated_storage
  storage_type      = var.storage_type
  iops              = var.iops
  storage_encrypted = var.storage_encrypted

  # Autentication
  username = var.username
  password = var.password

  # Networking
  availability_zone      = var.availability_zone != null ? "${var.context.region}${var.availability_zone}" : null
  db_subnet_group_name   = module.subnet_group.name
  vpc_security_group_ids = var.security_groups

  # Configuration
  parameter_group_name    = module.parameter_group.name
  backup_retention_period = var.backup_retention_period
  skip_final_snapshot     = var.skip_final_snapshot
  replicate_source_db     = var.replicate_source_db
  snapshot_identifier     = var.snapshot_identifier
  deletion_protection     = var.deletion_protection

  # Licensing
  license_model = var.license_model

  tags = local.combined_tags

  lifecycle {
    ignore_changes = [password]
  }

}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>