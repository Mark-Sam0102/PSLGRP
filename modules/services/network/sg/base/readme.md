[comment]: # (BEGIN_TF_DOCS)

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| rules | ../rules | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_security_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| description | Security group description. | `string` | n/a | yes |
| egress | Configuration block for egress rules. | <pre>list(object({<br>    description       = string<br>    from              = number<br>    to                = number<br>    protocol          = string<br>    address_space     = list(string)<br>    network_type      = string<br>    security_group_id = string<br>  }))</pre> | n/a | yes |
| ingress | Configuration block for egress rules. | <pre>list(object({<br>    description       = string<br>    from              = number<br>    to                = number<br>    protocol          = string<br>    address_space     = list(string)<br>    network_type      = string<br>    security_group_id = string<br>  }))</pre> | n/a | yes |
| name | Name used while applying tags to the resource | `string` | n/a | yes |
| vpc\_id | The VPC ID. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| arn | ARN of the security group. |
| id | ID of the resource |

[comment]: # (END_TF_DOCS)