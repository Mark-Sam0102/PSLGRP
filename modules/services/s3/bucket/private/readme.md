# S3 bucket - Private

This module provisions an S3 bucket and configures it so that it cannot be made public accidentally.

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

| Name | Source | Version |
|------|--------|---------|
| main | ../base | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket_public_access_block.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |

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
| ssl\_requests\_only | To control whether insecure (HTTP) requests should be allowed or not | `bool` | `true` | no |
| versioning | The versioning status of S3 bucket. Accepted values are: Enabled, Suspended, or Disabled | `string` | `"Disabled"` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The Amazon Resource Name (ARN) of the S3 bucket |
| domain\_name | The bucket domain name. |
| id | The ID of the S3 bucket |
| object | Important attributes of the resource such as ID and ARN as a single object / map |
| regional\_domain\_name | The bucket region-specific domain name. AWS CloudFront allows specifying S3 region-specific endpoint when creating S3 origin, it will prevent redirect issues from CloudFront to S3 Origin URL. |

[comment]: # (END_TF_DOCS)