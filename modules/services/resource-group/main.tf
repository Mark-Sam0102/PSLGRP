locals {

  app_tag  = { "app" = var.context.application_name }
  env_tag  = { "env" = var.context.environment_name }
  name_tag = { "Name" = var.name }

  # create a consolidated map
  combined_tags = merge(local.app_tag, local.env_tag, var.context.tags)

  # convert the map to a list of objects with the same structure (name,value)
  foo = flatten([
    for x, y in local.combined_tags : {
      name  = x
      value = y
    }
  ])

  # transpose the list of objects into AWS JSON format
  tag_filters = [for s in local.foo :
    {
      "Key"    = s["name"],
      "Values" = [s["value"]]
    }
  ]
}

/*
      ResourceTypeFilters : ["AWS::AllSupported"],
      TagFilters : [
        {
          Key: "foo",
          Values: ["bar"]
        }
      ]
*/
resource "aws_resourcegroups_group" "main" {

  name = var.name

  resource_query {
    query = jsonencode({
      ResourceTypeFilters : ["AWS::AllSupported"],
      TagFilters : local.tag_filters
    })
  }

}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
