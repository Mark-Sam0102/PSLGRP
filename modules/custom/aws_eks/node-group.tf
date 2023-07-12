module "node_group" {

  source = "../modules/services/eks/nodes/managed-node-group"
  disk_size = local.disk_size

  name    = "eks-node-group-${local.service_name}"
  context = local.primary_context

  cluster_name  = module.eks_cluster.id
  node_role_arn = module.node_group_role.arn

  desired_size = local.min_size
  max_size     = local.max_size
  min_size     = local.min_size

  max_unavailable = 1

  capacity_type = local.capacity_type

  subnets = local.public_subnet_ids

  depends_on = [module.node_group_role]
  instance_type = local.instance_type

}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>