[comment]: # (BEGIN_TF_DOCS)

## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| node\_group\_role | ../../../iam/role/base | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| attached\_policies | List of ARN's attached to the role. Few policies are already attached. | `list(string)` | `[]` | no |
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| description | Description of the role. | `string` | `"IAM Role for EKS Node Group."` | no |
| max\_session\_duration | Maximum session duration (in seconds) that you want to set for the specified role. | `number` | `3600` | no |
| name | Name of the role. | `string` | n/a | yes |
| path | Path to the role. | `string` | `"/"` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | Amazon Resource Name (ARN) of the IAM Role of EKS Node Group |
| id | ID of IAM Role of EKS Node Group |

[comment]: # (END_TF_DOCS)