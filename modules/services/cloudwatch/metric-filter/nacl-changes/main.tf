resource "aws_cloudwatch_log_metric_filter" "main" {
  name           = "${var.name_prefix}-nacl-changes"
  pattern        = "{ ($.eventName = CreateNetworkAcl) || ($.eventName = CreateNetworkAclEntry) || ($.eventName = DeleteNetworkAcl) || ($.eventName = DeleteNetworkAclEntry) || ($.eventName = ReplaceNetworkAclEntry) || ($.eventName = ReplaceNetworkAclAssociation) }"
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "${var.name_prefix}NACLChangeCount"
    namespace = var.metric_namespace
    value     = "1"
  }
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
