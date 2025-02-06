provider "aws" {
  region = "eu-central-1"
}

module "apprunner" {
  source = "../.."

  name               = "ecr-public"
  configuration_type = "IMAGE"

  image_identifier        = var.image_identifier
  image_repository_type   = "ECR_PUBLIC"
  enable_auto_deployments = false

  max_concurrency = 100
  max_size        = 1
  min_size        = 1
}
