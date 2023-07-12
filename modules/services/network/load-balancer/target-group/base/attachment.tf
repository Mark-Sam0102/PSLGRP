resource "aws_lb_target_group_attachment" "main" {
  count = length(var.target_ids)

  target_group_arn = aws_lb_target_group.main.arn
  target_id        = var.target_ids[count.index]
  port             = var.port
}