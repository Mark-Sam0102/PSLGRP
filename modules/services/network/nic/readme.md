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
| [aws_network_interface.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_interface) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| name | The name to use for the ENI | `string` | n/a | yes |
| private\_ips | List of private IPs to assign to the ENI. | `list(string)` | `null` | no |
| security\_groups | List of security group IDs to assign to the ENI. | `list(string)` | `null` | no |
| subnet\_id | Subnet ID to create the ENI in. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | n/a |
| private\_ip | n/a |

[comment]: # (END_TF_DOCS)