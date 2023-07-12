# Generate a random string to keep names unique
resource "random_string" "random" {
  length  = 8
  special = false
  lower   = true
  upper   = false
}
locals {
  vpc_id = var.vpc_id
  public_subnet_ids = var.public_subnet_ids
  deployment_id = var.PIPOD_DEPLOYMENT_ID
  endpoint = module.eks_cluster.endpoint
  platform_version = module.eks_cluster.platform_version
  vpc_config-subnet_ids = var.public_subnet_ids
  vpc_config-vpc_id = var.vpc_id
  identity-oidc-issuer = module.eks_cluster.oidc
  cluster_name = var.cluster_name
  kubernetes_version = var.kubernetes_version
  max_size = var.max_size
  min_size = var.min_size
  service_name            = random_string.random.result
  endpoint_private_access = var.endpoint_private_access
  endpoint_public_access  = var.endpoint_public_access
  instance_type = var.instance_type
  disk_size = var.disk_size
  capacity_type = var.capacity_type
  primary_context = {
    application_name = var.application_name
    environment_name = var.environment_name
    region = "us-east-1"
    tags = var.tags

  }


}

resource "time_offset" "expire_date" {
  offset_days = 2
}
module "resource-group" {

  source  = "../modules/services/resource-group/base"
  context = local.primary_context
  name    = "${var.application_name}-${var.environment_name}-${local.service_name}"

}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
