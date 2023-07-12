[comment]: # (BEGIN_TF_DOCS)

## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| main | ../../base | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allocated\_storage | The allocated storage in gibibytes. | `number` | n/a | yes |
| availability\_zone | The AZ for the RDS instance. | `string` | `null` | no |
| backup\_retention\_period | Name used while applying tags to the resource | `number` | `30` | no |
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| db\_name | Name used while applying tags to the resource | `string` | `null` | no |
| deletion\_protection | If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to true. | `bool` | `true` | no |
| engine\_version | The engine version to use. If auto\_minor\_version\_upgrade is enabled, you can provide a prefix of the version such as 5.7. https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_PostgreSQL.html#PostgreSQL.Concepts.General.DBVersions | `string` | n/a | yes |
| instance\_class | The instance type of the RDS instance. | `string` | `"db.t2.small"` | no |
| iops | The amount of provisioned IOPS. Setting this implies a storage\_type of .io1..e | `number` | `null` | no |
| multi\_az | Specifies if the RDS instance is multi-AZ | `bool` | `false` | no |
| name | The name of the RDS instance. | `string` | n/a | yes |
| parameters | A list of DB parameters to apply. | `map(string)` | `{}` | no |
| password | Password for the master DB user. | `string` | n/a | yes |
| replicate\_source\_db | Specifies that this resource is a Replicate database, | `string` | `null` | no |
| security\_groups | List of VPC security groups to associate. | `list(string)` | `null` | no |
| skip\_final\_snapshot | Determines whether a final DB snapshot is created before the DB instance is deleted. | `bool` | `true` | no |
| storage\_type | One of .standard' (magnetic), 'gp2. (general purpose SSD), or .io1. (provisioned IOPS SSD). The default is .io1. if iops is specified, .gp2. if not. | `string` | `"gp2"` | no |
| subnets | list of subnets | `list(string)` | n/a | yes |
| username | Username for the master DB user. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| address | The hostname of the RDS instance. See also endpoint and port. |
| arn | The ARN (Amazon Resource Name) for the resource |
| db\_name | The database name. |
| endpoint | The connection endpoint in address:port format. |
| id | ID of the resource |
| port | The database port. |

[comment]: # (END_TF_DOCS)