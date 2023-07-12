resource "aws_customer_gateway" "main" {
  bgp_asn         = var.bgp_asn
  ip_address      = var.ip_address
  type            = var.type
  certificate_arn = var.certificate_arn
  device_name     = var.device_name
  tags            = local.combined_tags
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
