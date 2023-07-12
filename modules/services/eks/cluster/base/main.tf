data "tls_certificate" "example" {
  url = aws_eks_cluster.main.identity[0].oidc[0].issuer
}

resource "aws_eks_cluster" "main" {
  name     = var.name
  role_arn = var.role_arn

  vpc_config {
    subnet_ids              = var.subnets
    endpoint_private_access = var.endpoint_private_access
    endpoint_public_access  = var.endpoint_public_access
  }
  tags = local.combined_tags
  version = var.kubernetes_version
}

resource "aws_iam_openid_connect_provider" "main" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.example.certificates[0].sha1_fingerprint]
  url             = aws_eks_cluster.main.identity[0].oidc[0].issuer
}
# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
