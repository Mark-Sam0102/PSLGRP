[comment]: # (BEGIN_TF_DOCS)

## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| policy | ../../../iam/policy/base | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket\_arns | ARNs of bucket that this statement applies to. | `list(string)` | n/a | yes |
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| description | Description of the IAM policy. | `string` | `null` | no |
| name | The name of resource | `string` | n/a | yes |
| path | Path in which to create the policy | `string` | `"/"` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | n/a |
| id | n/a |
| name | n/a |

[comment]: # (END_TF_DOCS)