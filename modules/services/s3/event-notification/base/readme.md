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
| [aws_lambda_permission.allow_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_s3_bucket_notification.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_notification) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket | The S3 buckets details | <pre>object({<br>    id  = string<br>    arn = string<br>  })</pre> | n/a | yes |
| lambda\_functions | The notification configuration for Lambda functions | <pre>list(object({<br>    id            = string<br>    arn           = string<br>    events        = list(string)<br>    filter_prefix = string<br>    filter_suffix = string<br>  }))</pre> | `[]` | no |
| queues | The notification configuration for SQS queues | <pre>list(object({<br>    id            = string<br>    arn           = string<br>    events        = list(string)<br>    filter_prefix = string<br>    filter_suffix = string<br>  }))</pre> | `[]` | no |
| topics | The notification configuration for SNS topic | <pre>list(object({<br>    id            = string<br>    arn           = string<br>    events        = list(string)<br>    filter_prefix = string<br>    filter_suffix = string<br>  }))</pre> | `[]` | no |

## Outputs

No outputs.

[comment]: # (END_TF_DOCS)