resource "aws_lb_listener_rule" "main" {
  listener_arn = var.listener_arn
  priority     = var.priority

  dynamic "action" {
    for_each = var.auth_type != null ? [1] : []

    content {
      type = var.auth_type

      dynamic "authenticate_cognito" {
        for_each = var.auth_type == "authenticate-cognito" ? [1] : []

        content {
          user_pool_arn       = var.cognito_data.user_pool_arn
          user_pool_client_id = var.cognito_data.user_pool_client_id
          user_pool_domain    = var.cognito_data.user_pool_domain
        }
      }

      dynamic "authenticate_oidc" {
        for_each = var.auth_type == "authenticate-oidc" ? [1] : []

        content {
          authorization_endpoint = var.oidc_data.authorization_endpoint
          client_id              = var.oidc_data.client_id
          client_secret          = var.oidc_data.client_secret
          issuer                 = var.oidc_data.issuer
          token_endpoint         = var.oidc_data.token_endpoint
          user_info_endpoint     = var.oidc_data.user_info_endpoint
        }
      }

    }

  }

  action {
    type             = var.action_type
    target_group_arn = var.action_type == "forward" && length(var.target_groups) == 1 ? var.target_groups[0].arn : null

    dynamic "forward" {
      for_each = var.action_type == "forward" && length(var.target_groups) > 1 ? [1] : []

      content {
        dynamic "target_group" {
          for_each = var.target_groups

          content {
            arn    = target_group.value.arn
            weight = target_group.value.weight
          }
        }
      }
    }

    dynamic "redirect" {
      for_each = var.action_type == "redirect" ? [1] : []

      content {
        status_code = var.redirect_status_code
        port        = var.redirect_port
        protocol    = var.redirect_protocol
        query       = var.redirect_query
      }
    }

    dynamic "fixed_response" {
      for_each = var.action_type == "fixed-response" ? [1] : []

      content {
        content_type = var.fixed_response_content_type
        message_body = var.fixed_response_message_body
        status_code  = var.fixed_response_status_code
      }
    }
  }

  dynamic "condition" {
    for_each = var.conditions

    content {
      dynamic "host_header" {
        for_each = condition.value.host_header != null ? [1] : []

        content {
          values = condition.value.host_header.values
        }
      }

      dynamic "http_header" {
        for_each = condition.value.http_header != null ? [1] : []

        content {
          http_header_name = condition.value.http_header.http_header_name
          values           = condition.value.http_header.values
        }
      }

      dynamic "http_request_method" {
        for_each = condition.value.http_request_method != null ? [1] : []

        content {
          values = condition.value.http_request_method.values
        }
      }

      dynamic "path_pattern" {
        for_each = condition.value.path_pattern != null ? [1] : []

        content {
          values = condition.value.path_pattern.values
        }
      }

      dynamic "query_string" {
        for_each = condition.value.query_string != null ? [1] : []

        content {
          key   = condition.value.query_string.key
          value = condition.value.query_string.value
        }
      }

      dynamic "source_ip" {
        for_each = condition.value.source_ip != null ? [1] : []

        content {
          values = condition.value.source_ip.values
        }
      }

    }
  }

  tags = local.combined_tags

}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>

