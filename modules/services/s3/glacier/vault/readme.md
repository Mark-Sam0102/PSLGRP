[comment]: # (BEGIN_TF_DOCS)

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3.0 |
| aws | ~> 4.40.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 4.40.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_glacier_vault.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glacier_vault) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_policy | Policy document | `string` | `null` | no |
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| name | Name of the Vault | `string` | n/a | yes |
| notification | Notifications for the Vault. | <pre>object({<br>    events    = list(string)<br>    sns_topic = string<br>  })</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | ARN of the vault |
| uri | URI of the vault that was created |

[comment]: # (END_TF_DOCS)