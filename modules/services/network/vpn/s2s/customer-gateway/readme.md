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
| [aws_customer_gateway.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/customer_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bgp\_asn | The gateway's Border Gateway Protocol (BGP) Autonomous System Number (ASN) | `number` | n/a | yes |
| certificate\_arn | The Amazon Resource Name (ARN) for the customer gateway certificate | `string` | `null` | no |
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| device\_name | A name for the customer gateway device | `string` | `null` | no |
| ip\_address | The IPv4 address for the customer gateway device's outside interface | `string` | n/a | yes |
| name | Name of the customer gateway | `string` | n/a | yes |
| type | The type of customer gateway | `string` | `"ipsec.1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | ARN of the customer gateway |
| id | ID of the gateway |

[comment]: # (END_TF_DOCS)