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
| [aws_db_parameter_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_parameter_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| family | The family of the DB parameter group. | `string` | n/a | yes |
| name | Name used while applying tags to the resource | `string` | n/a | yes |
| parameters | A list of DB parameters to apply. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | ID of the resource |
| name | name of the resource |

[comment]: # (END_TF_DOCS)