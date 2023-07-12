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
| [aws_dms_certificate.cert](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dms_certificate) | resource |
| [aws_dms_endpoint.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dms_endpoint) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| certificate\_name | The certificate identifier | `string` | `null` | no |
| context | The context object provides important details about the environment that this resource will be deployed into. | <pre>object({<br>    application_name = string<br>    environment_name = string<br>    tags             = map(string)<br>  })</pre> | n/a | yes |
| engine\_name | The type of engine for the endpoint | `string` | n/a | yes |
| name | The database endpoint identifier | `string` | n/a | yes |
| password | The password to be used to login to the endpoint database. | `string` | n/a | yes |
| pem\_file | The contents of the .pem X.509 certificate file for the certificate | `string` | `null` | no |
| port | The port used by the endpoint database | `number` | n/a | yes |
| server\_name | The host name of the server | `string` | n/a | yes |
| type | The type of endpoint. | `string` | n/a | yes |
| username | The user name to be used to login to the endpoint database. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| arn | n/a |

[comment]: # (END_TF_DOCS)