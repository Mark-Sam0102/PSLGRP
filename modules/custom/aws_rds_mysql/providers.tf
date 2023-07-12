provider "aws" {
  region                  = var.region
  profile                 = "default"
  shared_credentials_file = ".aws/credentials"
}

data "aws_availability_zones" "available" {}

# Not required: currently used in conjunction with using
# icanhazip.com to determine local workstation external IP
# to open EC2 Security Group access to the Kubernetes cluster.
# See workstation-external-ip.tf for additional information.
provider "http" {}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
