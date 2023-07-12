module "eks_cluster" {

  source = "../modules/services/eks/cluster/base"


  name = local.cluster_name
  context = local.primary_context

  role_arn = module.cluster_role.arn

  # If public = true and private = true, then the Amazon EKS API endpoint is accessible and resolvable over the internet and from within the connected networks of the VPC. 
  # The connected networks include DX, a VPN, or a VPC peered connection. 
  # If you access the endpoint from within the same VPC, then the endpoint resolves to internal IP. 
  # However, if you access the endpoint through the connected networks like DX, a VPN, or a VPC peered connection, the API endpoint resolves to the public IP.

  endpoint_private_access = local.endpoint_private_access
  endpoint_public_access  = local.endpoint_public_access
  kubernetes_version = local.kubernetes_version

  subnets = local.public_subnet_ids

  depends_on = [
    module.cluster_role
  ]
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>