# Rules

## Overview
This module uses the rule module to create the required number of rules as per the specification using the inputs.



[comment]: # (BEGIN_TF_DOCS)

## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| egress\_rules | ../rule | n/a |
| ingress\_rules | ../rule | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| egress | An egress rule specifying required details to restrict/allow outbound traffic | <pre>list(object({<br>    protocol        = string<br>    rule_no         = number<br>    action          = string<br>    cidr_block      = string<br>    ipv6_cidr_block = string<br>    from_port       = number<br>    to_port         = number<br>  }))</pre> | n/a | yes |
| ingress | An ingress rule specifying required details to restrict/allow inbound traffic | <pre>list(object({<br>    protocol        = string<br>    rule_no         = number<br>    action          = string<br>    cidr_block      = string<br>    ipv6_cidr_block = string<br>    from_port       = number<br>    to_port         = number<br>  }))</pre> | n/a | yes |
| network\_acl\_id | Id of the nacl to which the rule belongs to | `string` | n/a | yes |

## Outputs

No outputs.

[comment]: # (END_TF_DOCS)