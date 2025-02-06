provider "aws" {
  region = "eu-central-1"
}

module "apprunner" {
  source = "../.."

  name               = "code-repository-configuration"
  configuration_type = "CODE"

  branch               = var.branch
  configuration_source = "REPOSITORY"
  connection_arn       = var.connection_arn
  repository_url       = var.repository_url

  max_concurrency = 100
  max_size        = 1
  min_size        = 1
}
