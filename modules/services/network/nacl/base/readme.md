# Network ACL

## Overview
This module provisions a network acl along with a set of ingress and egress rules belonging to that acl.



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
| [aws_network_acl.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| egress | An egress rule specifying required details to restrict/allow outbound traffic | <pre>list(object({<br>    protocol        = string<br>    rule_no         = number<br>    action          = string<br>    cidr_block      = string<br>    ipv6_cidr_block = string<br>    from_port       = number<br>    to_port         = number<br>  }))</pre> | n/a | yes |
| ingress | An ingress rule specifying required details to restrict/allow inbound traffic | <pre>list(object({<br>    protocol        = string<br>    rule_no         = number<br>    action          = string<br>    cidr_block      = string<br>    ipv6_cidr_block = string<br>    from_port       = number<br>    to_port         = number<br>  }))</pre> | n/a | yes |
| name | Name used while applying tags to the resource | `string` | n/a | yes |
| subnet\_ids | Set of subnet ids that the nacl will be applied to | `list(string)` | `[]` | no |
| vpc\_id | Id of the vpc that the nacl will belong to | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | Id of the generated network acl |

[comment]: # (END_TF_DOCS)