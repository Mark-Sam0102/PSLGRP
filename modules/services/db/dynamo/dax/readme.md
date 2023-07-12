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
| [aws_dax_cluster.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dax_cluster) | resource |
| [aws_dax_subnet_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dax_subnet_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| availability\_zones | List of Availability Zones in which the nodes will be created | `list(string)` | `null` | no |
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| description | Description for the cluster | `string` | `null` | no |
| endpoint\_encryption\_type | The type of encryption the cluster's endpoint should support | `string` | `"TLS"` | no |
| maintenance\_window | Specifies the weekly time range for when maintenance on the cluster is performed | `string` | `null` | no |
| name | Group identifier | `string` | n/a | yes |
| node\_type | The compute and memory capacity of the nodes | `string` | n/a | yes |
| parameter\_group\_name | Name of the parameter group to associate with this DAX cluster | `string` | `null` | no |
| replication\_factor | The number of nodes in the DAX cluster | `number` | n/a | yes |
| role\_arn | A valid Amazon Resource Name (ARN) that identifies an IAM role | `string` | n/a | yes |
| security\_group\_ids | One or more VPC security groups associated with the cluster | `list(string)` | `null` | no |
| server\_side\_encryption | Encrypt at rest options | `bool` | `true` | no |
| sns\_topic\_arn | An Amazon Resource Name (ARN) of an SNS topic to send DAX notifications to | `string` | `null` | no |
| subnet\_ids | A list of VPC subnet IDs for the subnet group | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of the DAX cluster |
| cluster\_address | The DNS name of the DAX cluster without the port appended |
| configuration\_endpoint | The configuration endpoint for this DAX cluster, consisting of a DNS name and a port number |
| nodes | List of node objects including id, address, port and availability\_zone |
| port | The port used by the configuration endpoint |
| subnet\_group\_id | The name of the subnet group |

[comment]: # (END_TF_DOCS)