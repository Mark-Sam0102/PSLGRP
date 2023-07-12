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
| [aws_security_group_rule.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| address\_space | address | `list(string)` | `[]` | no |
| description | Description of the rule. | `string` | n/a | yes |
| from | Start port | `number` | n/a | yes |
| network\_type | Type of network | `string` | `null` | no |
| protocol | Protocol. If not icmp, icmpv6, tcp, udp, or all use the protocol number | `string` | n/a | yes |
| security\_group\_id | Security group to apply this rule to. | `string` | n/a | yes |
| source\_security\_group\_id | Security group id to allow access to/from, depending on the type. | `string` | `null` | no |
| to | End port | `number` | n/a | yes |
| type | Type of rule being created. Valid options are ingress (inbound) or egress (outbound) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | ID of the resource |

[comment]: # (END_TF_DOCS)