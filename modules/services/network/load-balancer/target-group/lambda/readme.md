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
| [aws_lambda_permission.permission](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_lb_target_group_attachment.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| name | name of the target group | `string` | n/a | yes |
| target\_id | The ID of the target. This is the  arn of lambda function. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| arn | ARN of the Target Group |
| attachment\_id | A unique identifier for the Target Group attachment |
| id | ID of the Target Group |

[comment]: # (END_TF_DOCS)