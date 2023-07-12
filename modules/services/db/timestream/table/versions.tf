terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.40.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0.1"
    }
  }
  required_version = ">= 1.3.0"
}

# © 2023 Persistent Systems, <cloud-automation-stack@persistent.com>
