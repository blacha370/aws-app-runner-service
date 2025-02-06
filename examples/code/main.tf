provider "aws" {
  region = "eu-central-1"
}

module "apprunner" {
  source = "../.."

  name               = "code"
  configuration_type = "CODE"
  start_command      = var.start_command

  branch               = var.branch
  build_command        = var.build_command
  configuration_source = "API"
  connection_arn       = var.connection_arn
  repository_url       = var.repository_url
  runtime              = var.runtime

  max_concurrency = 100
  max_size        = 1
  min_size        = 1
}
