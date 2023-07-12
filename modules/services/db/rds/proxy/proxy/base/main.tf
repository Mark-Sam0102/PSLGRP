resource "aws_db_proxy" "main" {
  name                   = var.name
  engine_family          = var.engine_family
  debug_logging          = var.debug_logging
  require_tls            = var.require_tls
  vpc_security_group_ids = var.security_groups
  vpc_subnet_ids         = var.subnets
  role_arn               = var.role_arn

  dynamic "auth" {
    for_each = var.auth

    content {
      secret_arn  = auth.value.secret_arn
      description = auth.value.description
      iam_auth    = auth.value.iam_auth
    }
  }

  tags = local.combined_tags
}
