[comment]: # (BEGIN_TF_DOCS)

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3.0 |
| aws | ~> 4.40.0 |
| random | ~> 3.0.1 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 4.40.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_timestreamwrite_table.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/timestreamwrite_table) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| database\_name | The name of the Table database | `string` | n/a | yes |
| magnetic\_store\_write\_properties | Contains properties to set on the table when enabling magnetic store writes. rejected\_data\_location and s3\_configuration can be optional. Possible values for encryption\_option in s3\_configuration are SSE\_KMS, SSE\_S3 or null, kms\_key\_id represent KMS key arn for the customer s3 location when encrypting with a KMS managed key and object\_key\_prefix adds prefix to organize the data stored in S3 buckets | <pre>object({<br>    magnetic_store_writes  = bool<br>    rejected_data_location = optional(object({<br>      s3_configuration     = optional(object({<br>        name               = optional(string)<br>        encryption_option  = optional(string)<br>        kms_key_id         = optional(string)<br>        object_key_prefix  = optional(string)<br>      }))<br>    }))<br>  })</pre> | `null` | no |
| name | The name of the Timestream table | `string` | n/a | yes |
| retention\_properties | The retention duration for the memory store and magnetic store | <pre>object({<br>    magnetic_store_retention_period_in_days = number<br>    memory_store_retention_period_in_hours  = number<br>  })</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The table ARN |
| id | The table ID |

[comment]: # (END_TF_DOCS)