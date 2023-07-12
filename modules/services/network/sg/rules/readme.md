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
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| egress | Configuration block for egress rules. | <pre>list(object({<br>    description       = string<br>    from              = number<br>    to                = number<br>    protocol          = string<br>    address_space     = list(string)<br>    network_type      = string<br>    security_group_id = string<br>  }))</pre> | `null` | no |
| ingress | Configuration block for ingress rules. | <pre>list(object({<br>    description       = string<br>    from              = number<br>    to                = number<br>    protocol          = string<br>    address_space     = list(string)<br>    network_type      = string<br>    security_group_id = string<br>  }))</pre> | `null` | no |
| security\_group\_id | Security group to apply this rule to. | `string` | n/a | yes |

## Outputs

No outputs.

[comment]: # (END_TF_DOCS)