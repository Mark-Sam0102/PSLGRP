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
| [aws_iam_policy_document.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| description | Description of the IAM policy. | `string` | `null` | no |
| name | The name of the policy | `string` | n/a | yes |
| path | Path in which to create the policy | `string` | `"/"` | no |
| statements | Configuration block for a policy statement. | <pre>list(object({<br>    actions   = list(string)<br>    resources = list(string)<br>    allow     = bool<br>    conditions = list(object({<br>      test     = string<br>      variable = string<br>      values   = list(string)<br>    }))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| arn | n/a |
| id | n/a |
| name | n/a |

[comment]: # (END_TF_DOCS)