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
| [aws_dms_replication_subnet_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dms_replication_subnet_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br><br>  })</pre> | n/a | yes |
| description | The description for the subnet group. | `string` | n/a | yes |
| name | The name for the replication subnet group. This value is stored as a lowercase string. | `string` | n/a | yes |
| subnet\_ids | A list of the EC2 subnet IDs for the subnet group. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| vpc\_id | The ID of the VPC the subnet group is in. |

[comment]: # (END_TF_DOCS)