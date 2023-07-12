resource "aws_lb_listener" "main" {
  load_balancer_arn = var.load_balancer_arn
  port              = var.port
  protocol          = var.protocol

  certificate_arn = var.certificate_arn
  ssl_policy      = var.ssl_policy

  dynamic "default_action" {
    for_each = var.auth_type != null ? [1] : []

    content {
      type = var.auth_type

      dynamic "authenticate_cognito" {
        for_each = var.auth_type == "authenticate-cognito" ? [1] : []

        content {
          user_pool_arn       = var.cognito_pool_arn
          user_pool_client_id = var.cognito_pool_client_id
          user_pool_domain    = var.cognito_pool_domain
        }
      }

      dynamic "authenticate_oidc" {
        for_each = var.auth_type == "authenticate-oidc" ? [1] : []

        content {
          authorization_endpoint = var.oidc_auth_endpoint
          client_id              = var.oidc_client_id
          client_secret          = var.oidc_client_secret
          issuer                 = var.oidc_issuer
          token_endpoint         = var.oidc_token_endpoint
          user_info_endpoint     = var.oidc_user_info_endpoint
        }
      }

    }

  }

  default_action {
    type             = var.default_action_type
    target_group_arn = var.default_action_type == "forward" && length(var.target_groups) == 1 ? var.target_groups[0].arn : null

    dynamic "forward" {
      for_each = var.default_action_type == "forward" && length(var.target_groups) > 1 ? [1] : []

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
      for_each = var.default_action_type == "redirect" ? [1] : []

      content {
        status_code = var.redirect_status_code
        port        = var.redirect_port
        protocol    = var.redirect_protocol
        query       = var.redirect_query
      }
    }

    dynamic "fixed_response" {
      for_each = var.default_action_type == "fixed-response" ? [1] : []

      content {
        content_type = var.fixed_response_content_type
        message_body = var.fixed_response_message_body
        status_code  = var.fixed_response_status_code
      }
    }
  }

  tags = local.combined_tags
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
