resource "aws_eip" "main" {

  vpc = true

  tags = local.combined_tags

}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
