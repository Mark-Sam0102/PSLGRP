# Network ACL Rule

## Overview
This module provisions a network acl rule belonging to an acl. The rule takes inputs such as the acl id, protocol, cidr block, action, type and based on these inputs a rule is generated restricting/allowing the network traffic.



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
| [aws_network_acl_rule.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| action | Indicates whether to allow or deny the traffic that matches the rule. Accepted values: allow \| deny | `string` | n/a | yes |
| cidr\_block | The network range to allow or deny, in CIDR notation | `string` | `null` | no |
| from\_port | The from port to match | `number` | n/a | yes |
| ipv6\_cidr\_block | The IPv6 CIDR block to allow or deny | `string` | `null` | no |
| network\_acl\_id | Id of the nacl to which the rule belongs to | `string` | n/a | yes |
| protocol | The network protocol for which the rule applies to | `string` | n/a | yes |
| rule\_number | The rule number for the rule. Rules are processed in ascending order of rule numbers | `number` | n/a | yes |
| to\_port | The to port to match | `number` | n/a | yes |
| type | Whether the rule is for ingress or egress traffic | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | Id of the generated rule |

[comment]: # (END_TF_DOCS)