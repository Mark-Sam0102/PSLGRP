resource "aws_docdb_cluster" "main" {

  cluster_identifier  = var.name
  engine              = var.engine
  master_username     = var.admin_username
  master_password     = var.admin_password
  skip_final_snapshot = var.skip_final_snapshot
  storage_encrypted   = true
  tags                = local.combined_tags
  kms_key_id          = var.kms_key_id
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
