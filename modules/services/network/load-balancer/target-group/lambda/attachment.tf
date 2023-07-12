resource "aws_lb_target_group_attachment" "main" {
  target_group_arn = module.main.arn
  target_id        = var.target_id
  port             = null

  depends_on = [aws_lambda_permission.permission]
}
