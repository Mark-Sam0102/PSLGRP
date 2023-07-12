resource "aws_iam_role_policy_attachment" "policy_attachments" {

  count = length(var.attached_policies)

  role       = aws_iam_role.main.name
  policy_arn = var.attached_policies[count.index]

}
