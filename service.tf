resource "aws_apprunner_service" "this" {
  service_name = var.name

  source_configuration {
    dynamic "authentication_configuration" {
      for_each = var.configuration_type == "IMAGE" && var.access_role_arn != "" ? [""] : []
      content {
        access_role_arn = var.access_role_arn
      }
    }

    dynamic "authentication_configuration" {
      for_each = var.configuration_type == "CODE" ? [""] : []
      content {
        connection_arn = aws_apprunner_connection.this[0].arn
      }
    }

    auto_deployments_enabled = var.enable_auto_deployments

    dynamic "code_repository" {
      for_each = var.configuration_type == "CODE" ? [""] : []
      content {
        code_configuration {
          dynamic "code_configuration_values" {
            for_each = var.configuration_source == "API" ? [""] : []
            content {
              build_command                 = var.build_command
              port                          = var.port
              runtime                       = var.runtime
              runtime_environment_secrets   = var.secrets
              runtime_environment_variables = var.variables
              start_command                 = var.start_command
            }
          }
          configuration_source = var.configuration_source
        }
        repository_url = var.repository_url
        source_code_version {
          type  = "BRANCH"
          value = var.branch
        }
        source_directory = var.directory
      }
    }

    dynamic "image_repository" {
      for_each = var.configuration_type == "IMAGE" ? [""] : []
      content {
        image_configuration {
          port                          = var.port
          runtime_environment_secrets   = var.secrets
          runtime_environment_variables = var.variables
          start_command                 = var.start_command
        }
        image_identifier      = var.image_identifier
        image_repository_type = var.image_repository_type
      }
    }
  }

  auto_scaling_configuration_arn = aws_apprunner_auto_scaling_configuration_version.this.arn

  dynamic "encryption_configuration" {
    for_each = var.kms_key != "" ? [""] : []
    content {
      kms_key = var.kms_key
    }
  }

  health_check_configuration {
    healthy_threshold   = var.healthy_threshold
    interval            = var.interval
    path                = var.path
    protocol            = var.protocol
    timeout             = var.timeout
    unhealthy_threshold = var.unhealthy_threshold
  }

  instance_configuration {
    cpu               = var.cpu
    instance_role_arn = var.instance_role_arn
    memory            = var.memory
  }

  network_configuration {
    dynamic "ingress_configuration" {
      for_each = var.enable_ingress != null ? [""] : []
      content {
        is_publicly_accessible = var.enable_ingress
      }
    }

    dynamic "egress_configuration" {
      for_each = var.enable_vpc_egress == true ? [""] : []
      content {
        egress_type       = "VPC"
        vpc_connector_arn = aws_apprunner_vpc_connector.this[0].arn
      }
    }

    ip_address_type = var.ip_address_type
  }

  dynamic "observability_configuration" {
    for_each = var.enable_x_ray ? [""] : []
    content {
      observability_enabled           = true
      observability_configuration_arn = aws_apprunner_observability_configuration.this[0].arn
    }
  }

  tags = var.tags
}