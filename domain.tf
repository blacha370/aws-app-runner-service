resource "aws_apprunner_custom_domain_association" "this" {
  count = var.domain_name != "" ? 1 : 0

  domain_name          = var.domain_name
  service_arn          = aws_apprunner_service.this.arn
  enable_www_subdomain = var.enable_www_subdomain
}
