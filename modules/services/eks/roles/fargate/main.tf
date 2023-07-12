locals {
  policies = concat(["arn:aws:iam::aws:policy/AmazonEKSFargatePodExecutionRolePolicy"], var.attached_policies)
}

module "fargate_profile_role" {

  source = "../../../iam/role/base"

  context = var.context

  name                 = var.name
  path                 = var.path
  description          = var.description
  max_session_duration = var.max_session_duration

  principals = [
    {
      type        = "Service",
      identifiers = ["eks-fargate-pods.amazonaws.com"]
    }
  ]
  attached_policies = local.policies
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
