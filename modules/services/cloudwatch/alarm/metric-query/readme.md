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
| [aws_cloudwatch_metric_alarm.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| actions | The list of actions ARN to execute when this alarm transitions into an ALARM state from any other state. | `list(string)` | `null` | no |
| comparison\_operator | The arithmetic operation to use when comparing the specified Statistic and Threshold. | `string` | n/a | yes |
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| description | Description of the alarm. | `string` | `null` | no |
| evaluation\_periods | The number of periods over which data is compared to the specified threshold. | `number` | n/a | yes |
| metric\_queries | Enables you to create an alarm based on a metric math expression | <pre>list(object({<br>    id          = string<br>    expression  = string<br>    label       = string<br>    return_data = string<br><br>    metric = object({<br>      name        = string<br>      namespace   = string<br>      period      = string<br>      stat        = string<br>      unit        = string<br>      dimensions  = map(string)<br><br>    })<br>  }))</pre> | `[]` | no |
| name | Name of the alarm. | `string` | n/a | yes |
| threshold | The value against which the specified statistic is compared. | `number` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of alarm. |
| id | The ID of alarm. |

[comment]: # (END_TF_DOCS)