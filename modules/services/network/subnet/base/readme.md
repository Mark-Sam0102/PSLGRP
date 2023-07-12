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
| [aws_subnet.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| address\_space | The CIDR block for the subnet. | `string` | n/a | yes |
| availability\_zone | The AZ for the subnet. | `string` | `null` | no |
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| map\_public\_ip | Specify true to indicate that instances launched into the subnet should be assigned a public IP address. | `bool` | `false` | no |
| name | The name to be used for the subnet | `string` | n/a | yes |
| vpc\_id | The VPC ID. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| address\_space | The CIDR block for the subnet. |
| arn | The ARN of the subnet. |
| id | The ID of the subnet |

[comment]: # (END_TF_DOCS)