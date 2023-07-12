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
| [aws_cloudwatch_log_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/cloudwatch_log_group) | data source |
| [aws_iam_policy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_s3_bucket.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/s3_bucket) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
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