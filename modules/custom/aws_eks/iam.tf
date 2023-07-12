module "node_group_role" {
  source = "../modules/services/eks/roles/node-group"

  context = local.primary_context
  name    = "eks-nodegroup-role-${local.service_name}"

}

module "cluster_role" {
  source = "../modules/services/eks/roles/cluster"

  context = local.primary_context
  name    = "eks-cluster-role-${local.service_name}"

}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>