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
| [aws_lightsail_instance.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lightsail_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| availability\_zone | The Availability Zone in which to create your instance | `string` | n/a | yes |
| blueprint\_id | The ID for a virtual private server image | `string` | n/a | yes |
| bundle\_id | The bundle of specification information | `string` | n/a | yes |
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| key\_pair\_name | The name of your key pair | `string` | `null` | no |
| name | The name of the Lightsail Instance. | `string` | n/a | yes |
| user\_data | launch script to configure server with additional user data | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of the Lightsail instance |
| id | The ARN of the Lightsail instance |
| private\_ip\_address | The private IP address of the instance |
| public\_ip\_address | The public IP address of the instance |

[comment]: # (END_TF_DOCS)