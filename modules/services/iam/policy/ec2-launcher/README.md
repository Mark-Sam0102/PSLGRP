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
| [aws_iam_policy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account\_id | Account ID for policies | `string` | n/a | yes |
| context | The context object provides important details about the environment that this resource will be deployed into. | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| description | The description of the policy | `string` | n/a | yes |
| name | The name of the policy | `string` | n/a | yes |
| path | The path of the policy | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | ID of created policy |

[comment]: # (END_TF_DOCS)