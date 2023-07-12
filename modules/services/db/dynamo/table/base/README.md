This module creates DynamoDB table with optional encryption parameteres, billing mode (provisioned or pay-per-request) and replication (regions in which table needs to replicated).

Pre-requisites:

1. An active AWS account with an IAM user that has administrative access.
2. Review AWS Service Quotas:
    1. Open the Service Quotas console at
       https://console.aws.amazon.com/servicequotas/home/.
    2. Use the Region selector in the navigation bar to choose the AWS Region where you plan to deploy.
    3. In the navigation pane, choose AWS services.
    4. On the AWS services page, you may scroll through the list of services or find a specific service like Amazon VPC or EC2.
    5. Check the quota names and default and applied quota values defined under this service.
    6. Ensure that you can allocate the following without exceeding relevant quota in the chosen AWS Region. If a
       quota increase is required that can be achieved using "Request quota increase" option in Step 5 above.
       1. 1 DynamoDB table

Usage:


Input mandatory variable. i.e. name (table name), hash_key (partition key. Table will be sharded based on this key), range_key(sort key. Items in a shard will be sorted based on this key). Another required variable is attributes (It is a array of objects. Object is in format(name,type). Name is name of the attribute and type is type of data in the table(i.e. Number or String etc)).

If encryption is required set encrypted_enabled to true (boolean) and set encryption_kms_key_arn to encryption key arn. If billing mode is PROVISIONED, then write and read capacity are also required. regions_for_replicas variables needs to be set if cross region replication is required. It is an array which contains names of the regions to which tables needs to replicated.

To create the infrastructure, run the following commands:

```hcl
    terraform init
    terraform apply
```
 Clean Up:

```hcl
    terraform destroy
```

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
| [aws_dynamodb_table.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| attributes | List of attribute definitions. Type must be a scalar type: 'S', 'N', or 'B' for (S)tring, (N)umber or (B)inary data | <pre>list(object({<br>    name = string<br>    type = string<br>  }))</pre> | n/a | yes |
| billing\_mode | Controls how you are charged for read and write throughput and how you manage capacity. valid values are 'PROVISIONED' and 'PAY\_PER\_REQUEST'. | `string` | `"PAY_PER_REQUEST"` | no |
| context | The context object provides important details about the environment that this resource will be deployed into | <pre>object({<br><br>    application_name = string<br>    environment_name = string<br><br>    region = string<br><br>    tags = map(string)<br>  })</pre> | n/a | yes |
| encryption | Whether or not to enable encryption at rest using an AWS managed KMS customer master key (CMK). | `bool` | `false` | no |
| global\_secondary\_indices | Describe a GSI for the table; subject to the normal limits on the number of GSIs, projected attributes, etc. | <pre>list(object({<br>    name               = string<br>    write_capacity     = number<br>    read_capacity      = number<br>    hash_key           = string<br>    range_key          = string<br>    projection_type    = string<br>    non_key_attributes = list(string)<br>  }))</pre> | `[]` | no |
| hash\_key | The attribute to use as the hash (partition) key. | `string` | n/a | yes |
| kms\_key | The ARN of the CMK that should be used for the AWS KMS encryption. | `string` | `null` | no |
| name | The name of the DynamoDB table. Needs to be unique within a region. | `string` | n/a | yes |
| point\_in\_time\_recovery | Whether to enable point-in-time recovery | `bool` | `false` | no |
| range\_key | The attribute to use as the range (sort) key. | `string` | n/a | yes |
| read\_capacity | The number of read units for this table. Required if 'billing\_mode' is 'PROVISIONED' | `number` | `null` | no |
| replicas | A list of region names for replicas. | `list(string)` | `[]` | no |
| stream\_view\_type | Setting this enables streams and determines the information written to it. Valid values are 'KEYS\_ONLY', 'NEW\_IMAGE', 'OLD\_IMAGE', 'NEW\_AND\_OLD\_IMAGES'. | `string` | `null` | no |
| write\_capacity | The number of write units for this table. Required if 'billing\_mode' is 'PROVISIONED' | `number` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | n/a |
| id | n/a |
| stream\_arn | n/a |
| stream\_label | n/a |

[comment]: # (END_TF_DOCS)