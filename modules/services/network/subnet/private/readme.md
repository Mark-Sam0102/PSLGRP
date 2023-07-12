[comment]: # (BEGIN_TF_DOCS)

## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| main | ../base | n/a |
| route | ../../route-table | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| address\_space | The CIDR block for the subnet. | `string` | n/a | yes |
| availability\_zone | The AZ for the subnet. | `string` | `null` | no |
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| name | The name to be used for provisioned resources | `string` | n/a | yes |
| nat\_gateway\_id | The ID of the NAT Gateway | `string` | n/a | yes |
| routes | n/a | <pre>list(object({<br>    address_space = string<br>    network_type  = string<br>    resource_id   = string<br>    resource_type = string<br>  }))</pre> | `[]` | no |
| vpc\_id | The VPC ID. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the subnet |
| route\_table\_id | The ID of the route table |

[comment]: # (END_TF_DOCS)