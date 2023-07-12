module "main" {
  source = "../base"

  context = var.context
  name    = var.name

  target_type = "lambda"
  target_ids  = []
}
resource "aws_lambda_permission" "permission" {

  statement_id  = "AllowExecutionFromTG"
  action        = "lambda:InvokeFunction"
  function_name = var.target_id
  principal     = "elasticloadbalancing.amazonaws.com"
  source_arn    = module.main.arn

}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
