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
| [aws_iam_role.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.policy_attachments](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| actions | List of STS actions. | `list(string)` | <pre>[<br>  "sts:AssumeRole"<br>]</pre> | no |
| attached\_policies | Policies that should be attached to the role | `list(string)` | `[]` | no |
| conditions | Constraints whether the role can be assumed in a particular situation. | <pre>list(object({<br>    test     = string<br>    variable = string<br>    values   = list(string)<br>  }))</pre> | `[]` | no |
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| description | Description of the role. | `string` | `null` | no |
| max\_session\_duration | Maximum session duration (in seconds) that you want to set for the specified role. | `number` | `3600` | no |
| name | Name of the role. | `string` | n/a | yes |
| path | Path to the role. | `string` | `"/"` | no |
| principals | Specifies the principals who can use the role. | <pre>list(object({<br>    type        = string<br>    identifiers = list(string)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| arn | n/a |
| id | n/a |
| name | n/a |

[comment]: # (END_TF_DOCS)