resource "aws_apprunner_auto_scaling_configuration_version" "this" {
  auto_scaling_configuration_name = var.name

  max_concurrency = var.max_concurrency
  max_size        = var.max_size
  min_size        = var.min_size

  tags = var.tags
}
