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
| [aws_ec2_transit_gateway.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| amazon\_side\_asn | Private Autonomous System Number (ASN) for the Amazon side of a BGP session.The range is 64512 to 65534 for 16-bit ASNs and 4200000000 to 4294967294 for 32-bit ASNs. | `number` | `null` | no |
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| default\_route\_table\_association | Determine if resource attachments will automatically associated with the default association route table or not. | `bool` | `true` | no |
| default\_route\_table\_propagation | Determine if resource attachments automatically propagate routes to the default propagation route table or not. | `bool` | `true` | no |
| description | Description of the EC2 Transit Gateway. | `string` | `null` | no |
| dns\_support | DNS support is enabled or not. | `bool` | `true` | no |
| name | Transit Gateway name. | `string` | n/a | yes |
| vpn\_ecmp\_support | VPN Equal Cost Multipath Protocol support is enabled or not. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | EC2 Transit Gateway ARN. |
| association\_default\_route\_table\_id | ID of the default association route table. |
| id | EC2 Transit Gateway ID. |
| propagation\_default\_route\_table\_id | ID of the default propagation route table. |

[comment]: # (END_TF_DOCS)