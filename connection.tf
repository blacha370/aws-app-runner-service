resource "aws_apprunner_connection" "this" {
  count = var.configuration_type == "CODE" ? 1 : 0

  connection_name = var.name
  provider_type   = "GITHUB"

  tags = var.tags
}