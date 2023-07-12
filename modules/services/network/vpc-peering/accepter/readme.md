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
| [aws_route.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_vpc_peering_connection_accepter.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection_accepter) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| peer\_vpc\_cidr | CIDR block in the Peer VPC to which routes should be created | `string` | n/a | yes |
| route\_table\_ids | The IDs of the route tables in the accepter VPC where routes should be created | `list(string)` | n/a | yes |
| vpc\_peering\_connection\_id | The VPC Peering Connection ID to manage. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the VPC Peering Connection. |

[comment]: # (END_TF_DOCS)