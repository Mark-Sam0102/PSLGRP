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
| [aws_dms_event_subscription.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dms_event_subscription) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| event\_categories | List of event categories to listen.<br> If event\_type is replication-instance: [creation, failure,low storage,configuration change,maintenance,deletion,failover] <br> If event\_type is replication-task : [creation, failure,state change,configuration change,deletion] | `list(string)` | `null` | no |
| name | Name of event subscription. | `string` | n/a | yes |
| sns\_topic\_arn | ARN of SNS topic. | `string` | n/a | yes |
| source\_ids | IDs of replication instance or replication task. | `list(string)` | n/a | yes |
| source\_type | Type of source for events. Valid values: replication-instance or replication-task | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of event subscription. |

[comment]: # (END_TF_DOCS)