locals {
  policies = concat(["arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy", "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy", "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"], var.attached_policies)
}

module "node_group_role" {

  source = "../../../iam/role/base"

  context = var.context

  name                 = var.name
  path                 = var.path
  description          = var.description
  max_session_duration = var.max_session_duration

  principals = [
    {
      type        = "Service",
      identifiers = ["ec2.amazonaws.com"]
    }
  ]
  attached_policies = local.policies
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
