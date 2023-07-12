<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.40.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.0.1 |
| <a name="requirement_time"></a> [time](#requirement\_time) | 0.7.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | ~> 3.0.1 |
| <a name="provider_time"></a> [time](#provider\_time) | 0.7.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_az"></a> [az](#module\_az) | ../../../services/network/az/public-private | n/a |
| <a name="module_igw"></a> [igw](#module\_igw) | ../../../services/network/igw | n/a |
| <a name="module_insights"></a> [insights](#module\_insights) | ../../../scenarios/cloudwatch/log-insights/rds | n/a |
| <a name="module_observability_stack"></a> [observability\_stack](#module\_observability\_stack) | ../../../scenarios/observability/base | n/a |
| <a name="module_resource-group"></a> [resource-group](#module\_resource-group) | ../../../services/resource-group/base | n/a |
| <a name="module_sqlserver"></a> [sqlserver](#module\_sqlserver) | ../../../services/db/rds/instance/sqlserver | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ../../../services/network/vpc/base | n/a |

## Resources

| Name | Type |
|------|------|
| [random_string.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [random_string.random](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [time_offset.expire_date](https://registry.terraform.io/providers/hashicorp/time/0.7.2/docs/resources/offset) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_added_by"></a> [added\_by](#input\_added\_by) | Name of the user who provisioned the resources, should be provided at the deployment | `string` | n/a | yes |
| <a name="input_application_name"></a> [application\_name](#input\_application\_name) | Indicates the logical group of the resources deployed together as the 'Application' name. This is the top-level name of the resources deployed together that share a common lifecycle. | `any` | n/a | yes |
| <a name="input_environment_name"></a> [environment\_name](#input\_environment\_name) | Indicates the lifecycle group of resources deployed for an Application. An 'Application' can have multiple instances deployed, each within a different position within the release 'lifecycle' (e.g. DEV, TEST, QA, STAGE, PROD) | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_password"></a> [password](#output\_password) | n/a |
| <a name="output_service_name"></a> [service\_name](#output\_service\_name) | n/a |
<!-- END_TF_DOCS -->