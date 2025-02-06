output "auto_scaling_configuration_arn" {
  value = aws_apprunner_auto_scaling_configuration_version.this.arn
}

output "connection_arn" {
  value      = aws_apprunner_connection.this[0].arn
  depends_on = [aws_apprunner_connection.this[0]]
}

output "custom_domain_association_arn" {
  value      = aws_apprunner_custom_domain_association.this[0].id
  depends_on = [aws_apprunner_custom_domain_association.this[0]]
}

output "certificate_validation_records" {
  value      = aws_apprunner_custom_domain_association.this[0].certificate_validation_records
  depends_on = [aws_apprunner_custom_domain_association.this[0]]
}

output "observability_configuration_arn" {
  value      = aws_apprunner_observability_configuration.this[0].arn
  depends_on = [aws_apprunner_observability_configuration.this[0]]
}

output "service_arn" {
  value = aws_apprunner_service.this.arn
}

output "service_url" {
  value = aws_apprunner_service.this.service_url
}

output "vpc_connector_arn" {
  value      = aws_apprunner_vpc_connector.this[0].arn
  depends_on = [aws_apprunner_vpc_connector.this[0]]
}
