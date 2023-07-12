resource "aws_dms_certificate" "cert" {

  count = var.certificate_name == null ? 0 : 1

  certificate_id  = var.certificate_name
  certificate_pem = var.pem_file

  tags = local.combined_tags
}

resource "aws_dms_endpoint" "main" {
  certificate_arn = var.certificate_name == null ? null : aws_dms_certificate.cert[0].certificate_arn
  endpoint_id     = var.name
  endpoint_type   = var.type
  engine_name     = var.engine_name
  username        = var.username
  password        = var.password
  server_name     = var.server_name
  port            = var.port

  tags = local.combined_tags
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
