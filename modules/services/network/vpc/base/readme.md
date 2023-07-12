[comment]: # "BEGIN_TF_DOCS"

## Requirements

| Name      | Version   |
| --------- | --------- |
| terraform | >= 0.13   |
| aws       | ~> 3.61.0 |

## Providers

| Name | Version   |
| ---- | --------- |
| aws  | ~> 3.61.0 |

## Modules

| Name                     | Source                                       | Version |
| ------------------------ | -------------------------------------------- | ------- |
| cloudwatch_log_publisher | ../../../iam/policy/cloudwatch-log-publisher | n/a     |
| vpc_flow_log_role        | ../../../iam/role/base                       | n/a     |

## Resources

| Name                                                                                                                            | Type     |
| ------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_default_network_acl.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_network_acl) | resource |
| [aws_flow_log.cloud_watch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log)                | resource |
| [aws_flow_log.s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log)                         | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc)                                 | resource |

## Inputs

| Name                   | Description                                                                                                  | Type                                                                                                                                                                                             | Default                                                                                                                                                                                                   | Required |
| ---------------------- | ------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------: |
| address_space          | The CIDR block for the VPC.                                                                                  | `string`                                                                                                                                                                                         | n/a                                                                                                                                                                                                       |   yes    |
| context                | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br> application_name = string<br> environment_name = string<br><br> region = string<br><br> tags = map(string)<br> })</pre>                                                    | n/a                                                                                                                                                                                                       |   yes    |
| egress                 | Configuration block for an egress rule.                                                                      | <pre>list(object({<br> protocol = string<br> rule_no = number<br> action = string<br> cidr_block = string<br> ipv6_cidr_block = string<br> from_port = number<br> to_port = number<br> }))</pre> | <pre>[<br> {<br> "action": "allow",<br> "cidr_block": "0.0.0.0/0",<br> "from_port": 0,<br> "ipv6_cidr_block": null,<br> "protocol": -1,<br> "rule_no": 100,<br> "to_port": 0<br> }<br>]</pre>             |    no    |
| ingress                | Configuration block for an ingress rule.                                                                     | <pre>list(object({<br> protocol = string<br> rule_no = number<br> action = string<br> cidr_block = string<br> ipv6_cidr_block = string<br> from_port = number<br> to_port = number<br> }))</pre> | <pre>[<br> {<br> "action": "allow",<br> "cidr_block": aws_vpc.main.cidr_block,<br> "from_port": 0,<br> "ipv6_cidr_block": null,<br> "protocol": -1,<br> "rule_no": 100,<br> "to_port": 0<br> }<br>]</pre> |    no    |
| name                   | resource name                                                                                                | `string`                                                                                                                                                                                         | n/a                                                                                                                                                                                                       |   yes    |
| observability_settings | ARN of s3 bucket and cloudwatch log group for long term and short term observability respectively            | <pre>object({<br> cloud_watch_log_group = string<br> s3_bucket = string<br> })</pre>                                                                                                             | n/a                                                                                                                                                                                                       |   yes    |

## Outputs

| Name | Description |
| ---- | ----------- |
| id   | n/a         |

[comment]: # "END_TF_DOCS"

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

| Name | Source | Version |
|------|--------|---------|
| cloudwatch\_log\_publisher | ../../../iam/policy/cloudwatch-log-publisher | n/a |
| vpc\_flow\_log\_role | ../../../iam/role/base | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_default_network_acl.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_network_acl) | resource |
| [aws_flow_log.cloud_watch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log) | resource |
| [aws_flow_log.s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| address\_space | The CIDR block for the VPC. | `string` | n/a | yes |
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| dns\_hostnames | A boolean flag to enable/disable DNS hostnames in the VPC. | `bool` | `false` | no |
| dns\_support | A boolean flag to enable/disable DNS hostnames in the VPC. | `bool` | `true` | no |
| egress | Configuration block for an egress rule. | <pre>list(object({<br>    protocol        = string<br>    rule_no         = number<br>    action          = string<br>    cidr_block      = string<br>    ipv6_cidr_block = string<br>    from_port       = number<br>    to_port         = number<br>  }))</pre> | `null` | no |
| ingress | Configuration block for an ingress rule. | <pre>list(object({<br>    protocol        = string<br>    rule_no         = number<br>    action          = string<br>    cidr_block      = string<br>    ipv6_cidr_block = string<br>    from_port       = number<br>    to_port         = number<br>  }))</pre> | `null` | no |
| name | resource name | `string` | n/a | yes |
| observability\_settings | The observability settings object provides basic configuration that can be used to configure logging and monitoring within a module | <pre>object({<br><br>    log_group = object({<br>      name = string<br>      arn  = string<br>    })<br>    bucket = object({<br>      id  = string<br>      arn = string<br>    })<br>    cloudwatch_log_publisher_policy = object({<br>      arn = string<br>      id  = string<br>    })<br>    retention_policy = object({<br>      short_term = number<br>      long_term  = number<br>    })<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| default\_network\_acl\_id | n/a |
| default\_route\_table\_id | n/a |
| id | n/a |

[comment]: # (END_TF_DOCS)