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
| [aws_ec2_transit_gateway_route_table_association.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_route_table_association) | resource |
| [aws_ec2_transit_gateway_vpc_attachment.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_vpc_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| appliance\_mode\_support | If enabled, a traffic flow between a source and destination uses the same AZ for the VPC attachment for the lifetime of that flow. | `bool` | `false` | no |
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| dns\_support | Whether DNS support is enabled. | `bool` | `true` | no |
| ipv6\_support | Whether IPv6 support is enabled. | `bool` | `false` | no |
| name | n/a | `string` | n/a | yes |
| subnets | ID of EC2 Subnets. | `list(string)` | n/a | yes |
| transit\_gateway\_default\_route\_table\_association | whether the VPC Attachment should be associated with the EC2 Transit Gateway association default route table. | `bool` | `true` | no |
| transit\_gateway\_default\_route\_table\_propagation | whether the VPC Attachment should propagate routes with the EC2 Transit Gateway propagation default route table. | `bool` | `true` | no |
| transit\_gateway\_id | ID of EC2 Transit Gateway. | `string` | n/a | yes |
| transit\_gateway\_route\_table\_id | Route table ID of transit gateway. | `string` | `null` | no |
| vpc\_id | ID of EC2 VPC. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | EC2 Transit Gateway Attachment ID. |

[comment]: # (END_TF_DOCS)