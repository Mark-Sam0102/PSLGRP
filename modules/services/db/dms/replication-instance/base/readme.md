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
| [aws_dms_replication_instance.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dms_replication_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| availability\_zone | Availability zone where the replication instance will be created. | `string` | `null` | no |
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| instance\_class | The compute and memory capacity of the replication instance. | `string` | n/a | yes |
| multi\_az | weather the replication instance is a multi-az deployment or not. | `bool` | `false` | no |
| name | The replication instance identifier. | `string` | n/a | yes |
| security\_group | A list of VPC security group IDs to be used with the replication instance. | `list(string)` | `null` | no |
| subnet\_group\_id | Subnet group to associate with the replication instance. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of replication instance. |
| id | Name of the replication instance. |
| private\_ips | A list of the private IP addresses of the replication instance. |
| public\_ips | A list of the public IP addresses of the replication instance. |

[comment]: # (END_TF_DOCS)