resource "aws_cloudwatch_log_metric_filter" "main" {

  name    = "${var.name_prefix}-s3-bucket-policy"
  pattern = "{($.eventSource = s3.amazonaws.com) && (($.eventName = PutBucketAcl) ||($.eventName = PutBucketPolicy) || ($.eventName = PutBucketCors) ||($.eventName = PutBucketLifecycle) || ($.eventName = PutBucketReplication) ||($.eventName = DeleteBucketPolicy) || ($.eventName = DeleteBucketCors) || ($.eventName = DeleteBucketLifecycle) || ($.eventName = DeleteBucketReplication)) }"

  log_group_name = var.log_group_name

  metric_transformation {
    name      = "${var.name_prefix}S3BucketPolicyChangeCount"
    namespace = var.metric_namespace
    value     = "1"
  }
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
