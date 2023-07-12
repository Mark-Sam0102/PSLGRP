module "rules" {

  source = "../rules"

  network_acl_id = aws_network_acl.main.id
  ingress = var.ingress
  egress  = var.egress

}