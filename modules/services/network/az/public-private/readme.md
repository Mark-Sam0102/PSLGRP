[comment]: # (BEGIN_TF_DOCS)

## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| subnet\_private | ../../subnet/private | n/a |
| subnet\_public | ../../subnet/public | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| availability\_zone | n/a | `string` | n/a | yes |
| context | n/a | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| igw\_id | n/a | `string` | n/a | yes |
| private\_address\_space | n/a | `string` | n/a | yes |
| private\_routes | n/a | <pre>list(object({<br>    address_space = string<br>    network_type  = string<br>    resource_id   = string<br>    resource_type = string<br>  }))</pre> | `[]` | no |
| public\_address\_space | n/a | `string` | n/a | yes |
| public\_routes | n/a | <pre>list(object({<br>    address_space = string<br>    network_type  = string<br>    resource_id   = string<br>    resource_type = string<br>  }))</pre> | `[]` | no |
| vpc\_id | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| private\_subnet\_id | The ID of the private subnet |
| private\_subnet\_route\_table\_id | The ID of the route table for private subnet |
| public\_subnet\_id | The ID of the public subnet |
| public\_subnet\_route\_table\_id | The ID of the route table for public subnet |

[comment]: # (END_TF_DOCS)