[comment]: # (BEGIN_TF_DOCS)

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_nat_gateway.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| connectivity\_type | Connectivity type for the gateway. Valid values are private and public. Defaults to public. | `string` | `"public"` | no |
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| eip\_id | The Allocation ID of the Elastic IP address for the gateway. Required for connectivity\_type of public. | `string` | `null` | no |
| name | Name used while applying tags to the resource | `string` | n/a | yes |
| subnet\_id | The Subnet ID of the subnet in which to place the gateway. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | ID of the resource |

[comment]: # (END_TF_DOCS)