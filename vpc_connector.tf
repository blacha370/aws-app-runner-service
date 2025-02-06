resource "aws_apprunner_vpc_connector" "this" {
  count = var.enable_vpc_egress == true ? 1 : 0

  vpc_connector_name = var.name
  subnets            = var.subnets
  security_groups    = var.security_groups

  tags = var.tags
}
