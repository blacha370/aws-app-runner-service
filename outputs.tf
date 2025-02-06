output "auto_scaling_configuration_arn" {
  value = aws_apprunner_auto_scaling_configuration_version.this.arn
}

output "connection_arn" {
  value = length(aws_apprunner_connection.this) != 0 ? aws_apprunner_connection.this[0].arn : null
}

output "custom_domain_association_id" {
  value = length(aws_apprunner_custom_domain_association.this) != 0 ? aws_apprunner_custom_domain_association.this[0].id : null
}

output "certificate_validation_records" {
  value = length(aws_apprunner_custom_domain_association.this) != 0 ? aws_apprunner_custom_domain_association.this[0].certificate_validation_records : null
}

output "observability_configuration_arn" {
  value = length(aws_apprunner_observability_configuration.this) != 0 ? aws_apprunner_observability_configuration.this[0].arn : null
}

output "service_arn" {
  value = aws_apprunner_service.this.arn
}

output "service_url" {
  value = aws_apprunner_service.this.service_url
}

output "vpc_connector_arn" {
  value = length(aws_apprunner_vpc_connector.this) != 0 ? aws_apprunner_vpc_connector.this[0].arn : null
}
