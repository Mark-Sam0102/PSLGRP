resource "aws_docdb_cluster_instance" "main" {

  identifier         = var.name
  cluster_identifier = var.cluster_id
  instance_class     = var.instance_class

  tags = local.combined_tags

}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
