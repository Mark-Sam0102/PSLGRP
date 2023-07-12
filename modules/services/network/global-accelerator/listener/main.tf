resource "aws_globalaccelerator_listener" "main" {
  accelerator_arn = var.accelerator_arn
  client_affinity = var.client_affinity
  protocol        = var.protocol

  dynamic "port_range" {
    for_each = var.port_ranges

    content {
      from_port = port_range.value.source_port
      to_port   = port_range.value.destination_port
    }
  }

}

resource "aws_globalaccelerator_endpoint_group" "main" {
  count = length(var.endpoint_groups)

  listener_arn            = aws_globalaccelerator_listener.main.id
  endpoint_group_region   = var.endpoint_groups[count.index].region
  traffic_dial_percentage = var.endpoint_groups[count.index].traffic_dial_percentage
  health_check_path       = var.endpoint_groups[count.index].health_check_path
  health_check_port       = var.endpoint_groups[count.index].health_check_port

  dynamic "endpoint_configuration" {
    for_each = var.endpoint_groups[count.index].endpoint_configurations

    content {
      endpoint_id                    = endpoint_configuration.value.endpoint_id
      weight                         = endpoint_configuration.value.weight
      client_ip_preservation_enabled = endpoint_configuration.value.client_ip_preservation
    }
  }

}

# © 2023 Persistent Systems, <cloud-automation-stack@persistent.com>
