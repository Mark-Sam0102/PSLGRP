resource "aws_flow_log" "cloud_watch" {
  iam_role_arn    = module.vpc_flow_log_role.arn
  log_destination = var.observability_settings.log_group.arn
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.main.id
  tags            = local.combined_tags
}
resource "aws_flow_log" "s3" {
  log_destination_type = "s3"
  log_destination      = var.observability_settings.bucket.arn
  traffic_type         = "ALL"
  vpc_id               = aws_vpc.main.id
  tags                 = local.combined_tags
}
