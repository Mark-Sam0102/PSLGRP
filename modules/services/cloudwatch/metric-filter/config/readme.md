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
| [aws_cloudwatch_log_metric_filter.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| log\_group\_name | Name of the log group to associate the metric filter with | `string` | n/a | yes |
| metric\_namespace | namespace of  metric | `string` | n/a | yes |
| name\_prefix | name of resource | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | The name of the metric filter |

[comment]: # (END_TF_DOCS)