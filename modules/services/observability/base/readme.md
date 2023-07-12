[comment]: # (BEGIN_TF_DOCS)

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| cloudwatch\_log\_publisher\_policy | ../../../services/iam/policy/cloudwatch-log-publisher | n/a |
| long\_term | ../../../services/s3/bucket/base | n/a |
| short\_term | ../../../services/cloudwatch/log-group | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket_lifecycle_configuration.s3_lifecycle_config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_elb_service_account.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/elb_service_account) | data source |
| [aws_iam_policy_document.s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account\_id | The account ID | `string` | `null` | no |
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br><br>  })</pre> | n/a | yes |
| force\_destroy | A boolean that indicates all objects (including any locked objects) should be deleted from the bucket so that the bucket can be destroyed without error. WARNING: Setting this might cause loss of data | `bool` | `false` | no |
| name | Resource name | `string` | n/a | yes |
| retention\_policy | Retains your configuration items for that specified period | <pre>object({<br>    short_term = number<br>    long_term  = number<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| bucket | The S3 bucket |
| bucket\_arn | The Amazon Resource Name (ARN) of the S3 Bucket |
| bucket\_id | The ID of the S3 Bucket |
| cloudwatch\_log\_publisher\_policy | The cloud watch log publisher policy info |
| log\_group | The CloudWatch Log Group |
| log\_group\_arn | The Amazon Resource Name (ARN) of the CloudWatch Log Group |
| log\_group\_name | The Name of the CloudWatch Log Group |
| result | The Observability Settings |
| retention\_policy | Retains your configuration items for that specified period |

[comment]: # (END_TF_DOCS)