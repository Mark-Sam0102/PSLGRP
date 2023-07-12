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
| tls | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eks_cluster.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_iam_openid_connect_provider.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [tls_certificate.example](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| endpoint\_private\_access | To enable the Amazon EKS private API server endpoint. | `bool` | `false` | no |
| endpoint\_public\_access | To enable the Amazon EKS public API server endpoint. | `bool` | `true` | no |
| name | Name of eks cluster | `string` | `"AWS-EKS"` | no |
| role\_arn | Amazon Resource Name (ARN) specifying the role for eks\_cluster | `string` | n/a | yes |
| subnets | List of subnet IDs associated with the eks cluster. Must be in at least two different availability zones. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | ARN of the cluster. |
| cluster\_security\_group\_id | Managed node groups use this Cluster security group for control-plane-to-data-plane communication. |
| endpoint | Endpoint for your Kubernetes API server |
| id | Name of the cluster. |
| kubeconfig\_certificate\_authority | Attribute block containing certificate-authority-data for your cluster. |
| oidc | Issuer URL for the OpenID Connect identity provider. |
| oidc\_provider\_arn | The ARN assigned by AWS for this provider. |
| vpc\_id | ID of the VPC associated with your cluster. |

[comment]: # (END_TF_DOCS)