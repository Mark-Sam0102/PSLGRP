resource "aws_iam_policy" "main" {
  name        = var.name
  path        = var.path
  description = var.description

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "iam:ListInstanceProfilesForRole",
          "iam:PassRole",
        ]
        Effect   = "Allow"
        Resource = ["arn:aws:iam::${var.account_id}:role/*"]
      },
      {
        Action = [
          "ec2:DescribeSpotInstanceRequests",
          "ec2:DescribeInstances",
          "ec2:DescribeKeyPairs",
          "ec2:DescribeRegions",
          "ec2:DescribeImages",
          "ec2:DescribeAvailabilityZones",
          "ec2:DescribeSecurityGroups",
          "ec2:DescribeSubnets",
        ]
        Effect   = "Allow"
        Resource = ["*"]
      },
      {
        Action = [
          "ec2:CancelSpotInstanceRequests",
          "ec2:RequestSpotInstances"
        ]
        Effect   = "Allow"
        Resource = ["arn:aws:ec2:${var.context.region}:${var.account_id}:spot-instances-request/*"]
      },
      {
        Action = [
          "ec2:GetConsoleOutput",
          "ec2:RunInstances",
          "ec2:StartInstances",
          "ec2:StopInstances",
          "ec2:TerminateInstances",
          "ec2:CreateTags",
          "ec2:DeleteTags",
          "ec2:GetPasswordData"
        ]
        Effect = "Allow"
        Resource = [
          "arn:aws:ec2:${var.context.region}:${var.account_id}:instances/*",
          "arn:aws:ec2:${var.context.region}:${var.account_id}:images/*",
          "arn:aws:ec2:${var.context.region}:${var.account_id}:security-group/*",
          "arn:aws:ec2:${var.context.region}:${var.account_id}:network-interface/*",
          "arn:aws:ec2:${var.context.region}:${var.account_id}:subnet/*",
          "arn:aws:ec2:${var.context.region}:${var.account_id}:volume/*"
        ]
      },
    ]
  })

  tags = local.combined_tags
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
