[comment]: # (BEGIN_TF_DOCS)

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3.0 |
| aws | ~> 4.40.0 |
| random | ~> 3.0.1 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 4.40.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| instance | ../../instance/base | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_docdb_cluster.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/docdb_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| admin\_password | n/a | `string` | n/a | yes |
| admin\_username | n/a | `string` | n/a | yes |
| context | n/a | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| engine | n/a | `string` | `"docdb"` | no |
| instance\_class | n/a | `string` | `null` | no |
| instance\_count | n/a | `number` | `0` | no |
| kms\_key\_id | n/a | `string` | `null` | no |
| name | n/a | `string` | n/a | yes |
| skip\_final\_snapshot | n/a | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | n/a |
| endpoint | n/a |
| id | n/a |
| read\_endpoint | n/a |

[comment]: # (END_TF_DOCS)