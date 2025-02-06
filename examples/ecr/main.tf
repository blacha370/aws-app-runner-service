provider "aws" {
  region = "eu-central-1"
}

module "apprunner" {
  source = "../.."

  name               = "ecr-private"
  configuration_type = "IMAGE"

  image_identifier      = var.image_identifier
  image_repository_type = "ECR"
  access_role_arn       = var.access_role_arn

  max_concurrency = 100
  max_size        = 1
  min_size        = 1
}
