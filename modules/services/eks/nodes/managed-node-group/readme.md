[comment]: # (BEGIN_TF_DOCS)

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eks_node_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster\_name | Name of the EKS Cluster | `string` | n/a | yes |
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| desired\_size | Desired number of worker nodes. | `number` | `1` | no |
| max\_size | Maximum number of worker nodes. | `number` | `1` | no |
| max\_unavailable | Desired max number of unavailable worker nodes during node group update. | `number` | `2` | no |
| min\_size | Minimum number of worker nodes. | `number` | `1` | no |
| name | Name of EKS Node Group | `string` | n/a | yes |
| node\_role\_arn | Amazon Resource Name (ARN) of the IAM Role that provides permissions for the EKS Node Group. | `string` | n/a | yes |
| subnets | The ID of the subnets associated with your cluster. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | Amazon Resource Name (ARN) of the EKS Node Group. |
| id | EKS Cluster name and EKS Node Group name separated by a colon (:). |
| resources | List of objects containing information about underlying resources. |
| status | Status of the EKS Node Group. |

[comment]: # (END_TF_DOCS)