resource "aws_docdb_cluster_parameter_group" "main" {
  family      = "docdb3.6"
  name        = "example"
  description = "docdb cluster parameter group"

  parameter {
    name  = "tls"
    value = "enabled"
  }
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
