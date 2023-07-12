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
| [aws_lb_target_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group_attachment.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| health\_check\_path | The destination for the health check request. | `string` | `null` | no |
| name | Name of Target Group | `string` | n/a | yes |
| port | Port on which targets receive traffic | `number` | `null` | no |
| protocol | Protocol to use for routing traffic to the targets | `string` | `null` | no |
| target\_ids | The ID of the target. | `list(string)` | `[]` | no |
| target\_type | Type of target that you must specify when registering targets with this target group | `string` | `"instance"` | no |
| vpc\_id | Identifier of the VPC in which to create the target group | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | ARN of the Target Group |
| attachment\_id | A unique identifier for the Target Group attachment |
| id | ID of the Target Group |

[comment]: # (END_TF_DOCS)