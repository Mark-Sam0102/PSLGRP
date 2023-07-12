module "rules" {

  source = "../rules"

  context           = var.context
  security_group_id = aws_security_group.main.id

  ingress = var.ingress
  egress  = var.egress

}
