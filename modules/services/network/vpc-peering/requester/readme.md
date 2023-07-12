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
| [aws_vpc_peering_connection.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| peer\_owner\_id | The AWS account ID of the owner of the peer VPC. | `string` | `null` | no |
| peer\_region | The region of the accepter VPC of the VPC Peering Connection. | `string` | `null` | no |
| peer\_vpc\_cidr | accepter cidr | `string` | n/a | yes |
| peer\_vpc\_id | The ID of the VPC with which you are creating the VPC Peering Connection. | `string` | n/a | yes |
| route\_table\_ids | IDs of route table. | `list(string)` | n/a | yes |
| vpc\_id | The ID of the requester VPC. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| accept\_status | n/a |
| id | n/a |

[comment]: # (END_TF_DOCS)