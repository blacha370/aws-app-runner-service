# aws-apprunner-service-module
## Table of Contents
- [Resources](#resources)
- [Inputs](#inputs)
- [Outputs](#outputs)

## Resources
| Name | Type |
|------|------|
| aws_apprunner_auto_scaling_configuration_version.this | resource |
| aws_apprunner_connection.this | resource |
| aws_apprunner_custom_domain_association.this | resource |
| aws_apprunner_observability_configuration.this | resource |
| aws_apprunner_service.this | resource |
| aws_apprunner_vpc_connector.this | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name to be used on all the resources as identifier | string | `null` | yes |
| tags | Key-value map of resource tags | map(string) | `{}` | no |
| configuration_type | Description | string | `null` | yes |
| enable_auto_deployments | Description | bool | `true` | no |
| port | Port that your application listens to in the container | string | `"8080"` | no |
| secrets | Secrets and parameters available to your service as environment variables. A map of key/value pairs, where the key is the desired name of the Secret in the environment, and the value is the ARN of the secret from AWS Secrets Manager or the ARN of the parameter in AWS SSM Parameter Store | map(string) | `{}` | no |
| start_command | Command App Runner runs to start your application. For `IMAGE` configuration_type this command overrides the Docker image’s default start command | string | `""` | no |
| variables | Environment variables available to your running App Runner service. A map of key/value pairs. Keys with a prefix of `AWSAPPRUNNER` are reserved for system use and aren't valid | map(string) | `{}` | no |
| branch | Branch name maps to a specific version. App Runner uses the most recent commit to the branch | string | `""` | no |
| build_command | Command App Runner runs to build your application | string | `""` | no |
| configuration_source | Source of the App Runner configuration. Valid values: `["REPOSITORY", "API"]`. | string | `""` | no |
| directory | The path of the directory that stores source code and configuration files. The build and start commands also execute from here. The path is absolute from root and, if not specified, defaults to the repository root | string | `""` | no |
| repository_url | Location of the repository that contains the source code | string | `""` | no |
| runtime | Runtime environment type for building and running an App Runner service. Represents a programming language runtime. Valid values: `["PYTHON_3", "NODEJS_12", "NODEJS_14", "NODEJS_16", "CORRETTO_8", "CORRETTO_11", "GO_1", "DOTNET_6, "PHP_81, "RUBY_31"]` | string | `""` | no |
| access_role_arn | ARN of the IAM role that grants the App Runner service access to a source repository. Required for ECR image repositories (but not for ECR Public) | string | `""` | no |
| image_identifier | dentifier of an image. For an image in Amazon Elastic Container Registry (Amazon ECR), this is an image name | stromg | `""` | no |
| image_repository_type | Type of the image repository. This reflects the repository provider and whether the repository is private or public. Valid values: `["ECR", "ECR_PUBLIC"]` | string | `""` | no |
| max_concurrency | Maximal number of concurrent requests that you want an instance to process. When the number of concurrent requests goes over this limit, App Runner scales up your service | number | null | yes |
| max_size | Maximal number of instances that App Runner provisions for your service | number | `null` | yes |
| min_size | Minimal number of instances that App Runner provisions for your service | number | `null` | yes |
| cpu | Number of CPU units reserved for each instance of your App Runner service represented as a String. Valid values: `["256", "512", "1024", "2048", "4096"]` | string | `1024` | no |
| instance_role_arn | ARN of an IAM role that provides permissions to your App Runner service. These are permissions that your code needs when it calls any AWS APIs. | string | `null` | no |
| memory |  Amount of memory, in MB or GB, reserved for each instance of your App Runner service. Valid values: `["512", "1024", "2048", "3072", "4096", "6144", "8192", "10240", "12288"]` | string | `2048` | no |
| healthy_threshold | Number of consecutive checks that must succeed before App Runner decides that the service is healthy. Minimum value of 1. Maximum value of 20 | number | `1` | no |
| interval | Time interval, in seconds, between health checks. Minimum value of 1. Maximum value of 20 | number | `5` | no |
| path | URL to send requests to for health checks. Minimum length of 0. Maximum length of 51200 | string | `"/"` | no |
| protocol | IP protocol that App Runner uses to perform health checks for your service. Valid values: `["TCP", "HTTP"]`. If you set protocol to HTTP, App Runner sends health check requests to the HTTP path specified by `path` | string | `"TCP"` | no |
| timeout | Time, in seconds, to wait for a health check response before deciding it failed. Minimum value of 1. Maximum value of 20 | number | `2` | no |
| unhealthy_threshold | Number of consecutive checks that must fail before App Runner decides that the service is unhealthy. Minimum value of 1. Maximum value of 20 | number | `5` | no |
| kms_key | ARN of the KMS key used for encryption | string | `""` | no |
| enable_x_ray | Description | bool | `false` | no |
| enable_ingress | Description | bool | `null` | no |
| enable_vpc_egress | Description | bool | `false` | no |
| ip_address_type | App Runner provides you with the option to choose between Internet Protocol version 4 (IPv4) and dual stack (IPv4 and IPv6) for your incoming public network configuration. Valid values: `["IPV4", "DUAL_STACK"]`. | string | `""` | no |
| security_groups | List of IDs of security groups that App Runner should use for access to AWS resources under the specified subnets. If not specified, App Runner uses the default security group of the Amazon VPC | list(string) | `[]` | no |
| subnets | List of IDs of subnets that App Runner should use when it associates your service with a custom Amazon VPC. Specify IDs of subnets of a single Amazon VPC | list(string) | `[]` | no |
| domain_name | Custom domain endpoint to association. Specify a base domain e.g., `example.com` or a subdomain e.g., `subdomain.example.com` | string | `""` | no |
| enable_www_subdomain | Whether to associate the subdomain with the App Runner service in addition to the base domain | bool | `true` | no |

## Outputs
| Name | Description |
|------|-------------|
| auto_scaling_configuration_arn | ARN of the App Runner AutoScaling Configuration Version | 
| connection_arn | ARN of the App Runner Connection |
| custom_domain_association_arn | ARN of the App Runner Custom Domain association |
| certificate_validation_records | A set of certificate CNAME records used for this domain name |
| observability_configuration_arn | ARN of the App Runner Observability Configuration |
| service_arn | ARN of the App Runner Service |
| service_url | Subdomain URL that App Runner generated for this service |
| vpc_connector_arn | ARN of the App Runner VPC Connector |