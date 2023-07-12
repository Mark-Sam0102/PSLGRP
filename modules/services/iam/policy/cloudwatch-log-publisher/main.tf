module "main" {

  source = "../base"

  context     = var.context
  name        = var.name
  path        = var.path
  description = var.description

  actions = [
    "logs:CreateLogGroup",
    "logs:CreateLogStream",
    "logs:PutLogEvents",
    "logs:DescribeLogStreams"
  ]

  resources = [
    "arn:aws:logs:*:*:*"
  ]

}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
