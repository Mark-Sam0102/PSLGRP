[comment]: # (BEGIN_TF_DOCS)

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3.0 |
| aws | ~> 4.40.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 4.40.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_vpn_gateway.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| amazon\_side\_asn | The Autonomous System Number (ASN) for the Amazon side of the gateway | `string` | `null` | no |
| availability\_zone | The Availability Zone for the virtual private gateway | `string` | `null` | no |
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| name | Name of the vpn gateway | `string` | n/a | yes |
| vpc\_id | The VPC ID to create in | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| amazon\_side\_asn | The Autonomous System Number (ASN) for the Amazon side of the gateway |
| arn | Amazon Resource Name (ARN) of the VPN Gateway |
| id | ID of the VPN Gateway |

[comment]: # (END_TF_DOCS)

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>