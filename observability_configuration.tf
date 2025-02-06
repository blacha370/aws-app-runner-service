resource "aws_apprunner_observability_configuration" "this" {
  count = var.enable_x_ray ? 1 : 0

  observability_configuration_name = var.name

  trace_configuration {
    vendor = "AWSXRAY"
  }

  tags = var.tags
}