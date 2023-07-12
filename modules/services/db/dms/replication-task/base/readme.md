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
| [aws_dms_replication_task.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dms_replication_task) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| migration\_type | The migration type. Can be one of full-load , cdc or full-load-and-cdc. | `string` | n/a | yes |
| name | The replication task identifier. | `string` | n/a | yes |
| replication\_instance\_arn | The Amazon Resource Name (ARN) of the replication instance. | `string` | n/a | yes |
| source\_endpoint\_arn | The Amazon Resource Name (ARN) string that uniquely identifies the source endpoint. | `string` | n/a | yes |
| table\_mappings | An escaped JSON string that contains the table mappings. | `string` | n/a | yes |
| target\_endpoint\_arn | The Amazon Resource Name (ARN) string that uniquely identifies the target endpoint. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of replication instance. |

[comment]: # (END_TF_DOCS)