# S3 bucket - base

This module provisions an S3 bucket.

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
| [aws_s3_bucket.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_cors_configuration.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_cors_configuration) | resource |
| [aws_s3_bucket_logging.bucket_logging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_logging) | resource |
| [aws_s3_bucket_policy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_request_payment_configuration.request_payer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_request_payment_configuration) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.bucket_encryption](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.bucket_versioning](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_s3_bucket_website_configuration.website_config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration) | resource |
| [aws_iam_policy_document.combined](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ssl_only](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| cors\_rules | Configuration to allow cross-origin access | <pre>list(object({<br>    allowed_headers = list(string)<br>    allowed_methods = list(string)<br>    allowed_origins = list(string)<br>    max_age_seconds = number<br>    expose_headers  = list(string)<br>  }))</pre> | `[]` | no |
| encryption\_algorithm | The server-side encryption algorithm to use. Valid values are `AES256` and `aws:kms` | `string` | `"AES256"` | no |
| force\_destroy | A boolean that indicates all objects (including any locked objects) should be deleted from the bucket so that the bucket can be destroyed without error. WARNING: Setting this might cause loss of data | `bool` | `false` | no |
| kms\_key\_id | The AWS KMS master key ID used for the SSE-KMS encryption. | `string` | `null` | no |
| logging\_prefix | To specify a key prefix for log objects. If no prefix is specified a default one is generated being `s3-access-logs/<bucket-name>/` | `string` | `null` | no |
| name | The name of the bucket. | `string` | n/a | yes |
| observability\_settings | The observability settings object provides basic configuration that can be used to configure logging and monitoring within a module | <pre>object({<br><br>    log_group = object({<br>      name = string<br>      arn  = string<br>    })<br>    bucket = object({<br>      id  = string<br>      arn = string<br>    })<br>    cloudwatch_log_publisher_policy = object({<br>      arn = string<br>      id  = string<br>    })<br>    retention_policy = object({<br>      short_term = number<br>      long_term  = number<br>    })<br>  })</pre> | `null` | no |
| policy\_documents | List of IAM policy documents to be merged together and used for the S3 bucket policy | `list(string)` | `[]` | no |
| requester\_pays | Specifies who should bear the cost of Amazon S3 data transfer. if false BucketOwner pay otherwise Requester pay | `bool` | `false` | no |
| ssl\_requests\_only | To control whether insecure (HTTP) requests should be allowed or not | `bool` | `true` | no |
| versioning | The versioning status of S3 bucket. Accepted values are: Enabled, Suspended, or Disabled | `string` | `"Disabled"` | no |
| website | Configuration to use the bucket as a static website | <pre>object({<br>    index_document = string<br>    error_document = string<br>  })</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The Amazon Resource Name (ARN) of the S3 bucket |
| domain\_name | The bucket domain name. |
| id | The ID of the S3 bucket |
| object | Important attributes of the resource such as ID and ARN as a single object / map |
| regional\_domain\_name | The bucket region-specific domain name. AWS CloudFront allows specifying S3 region-specific endpoint when creating S3 origin, it will prevent redirect issues from CloudFront to S3 Origin URL. |
| website\_domain | The domain of the website endpoint, if the bucket is configured with a website. If not, this will be an empty string. This is used to create Route 53 alias records. |
| website\_endpoint | The website endpoint, if the bucket is configured with a website. If not, this will be an empty string. |

[comment]: # (END_TF_DOCS)