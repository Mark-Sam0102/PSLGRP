resource "aws_cloudwatch_log_metric_filter" "main" {
  name           = "${var.name_prefix}-root-account-usage"
  pattern        = "{ $.userIdentity.type = \"Root\" && $.userIdentity.invokedBy NOT EXISTS && $.eventType != \"AwsServiceEvent\" }"
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "${var.name_prefix}RootAccountUsage"
    namespace = var.metric_namespace
    value     = 1
  }

}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
