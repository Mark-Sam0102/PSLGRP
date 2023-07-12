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

| Name | Source | Version |
|------|--------|---------|
| metric\_alarm | ../../../../../../services/cloudwatch/alarm/base | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_vpn_connection.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_connection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| customer\_gateway\_id | The ID of the customer gateway | `string` | n/a | yes |
| name | Name of the Site to site connection | `string` | n/a | yes |
| transit\_gateway\_id | ID of the EC2 Transit Gateway | `string` | `null` | no |
| tunnel1\_inside\_cidr | The CIDR block of the inside IP addresses for the first VPN tunnel | `string` | `null` | no |
| tunnel2\_inside\_cidr | The CIDR block of the inside IP addresses for the second VPN tunnel | `string` | `null` | no |
| type | Type of VPN connection | `string` | `"ipsec.1"` | no |
| vpn\_gateway\_id | ID of the Virtual Private Gateway | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | Amazon Resource Name (ARN) of the VPN Connection |
| id | Amazon-assigned ID of the VPN connection |

[comment]: # (END_TF_DOCS)