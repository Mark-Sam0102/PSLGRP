locals {
  policies = concat(["arn:aws:iam::aws:policy/AmazonEKSClusterPolicy", "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"], var.attached_policies)
}

module "eks_cluster_role" {

  source = "../../../iam/role/base"

  context = var.context

  name                 = var.name
  path                 = var.path
  description          = var.description
  max_session_duration = var.max_session_duration

  principals = [
    {
      type        = "Service",
      identifiers = ["eks.amazonaws.com"]
    }
  ]
  attached_policies = local.policies
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
