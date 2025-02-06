####################################
#   Project
####################################

variable "name" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

####################################
#   Shared Source Configuration
####################################

variable "configuration_type" {
  type = string

  validation {
    condition     = contains(["CODE", "IMAGE"], var.configuration_type)
    error_message = "Valid configuration_type values are [\"CODE\", \"IMAGE\"]"
  }
}

variable "enable_auto_deployments" {
  type    = bool
  default = true
}

variable "port" {
  type    = string
  default = "8080"

  validation {
    condition     = var.configuration_type == "IMAGE" && length(var.port) != 0 || var.configuration_type == "CODE" && var.configuration_source == "REPOSITORY" || var.configuration_type == "CODE" && var.configuration_source == "API" && length(var.port) != 0
    error_message = "Valid port cannot be empty"
  }
}

variable "secrets" {
  type    = map(string)
  default = {}
}

variable "start_command" {
  type    = string
  default = ""

  validation {
    condition     = var.configuration_type == "IMAGE" || var.configuration_type == "CODE" && var.configuration_source == "REPOSITORY" || var.configuration_type == "CODE" && var.configuration_source == "API" && length(var.start_command) != 0
    error_message = "Valid start_command cannot be empty"
  }
}

variable "variables" {
  type    = map(string)
  default = {}
}

####################################
#   Code Source Configuration
####################################

variable "branch" {
  type    = string
  default = ""

  validation {
    condition     = var.configuration_type == "IMAGE" || length(var.branch) != 0
    error_message = "Valid branch cannot be empty"
  }
}

variable "build_command" {
  type    = string
  default = ""

  validation {
    condition     = var.configuration_type == "IMAGE" || var.configuration_source == "REPOSITORY" || var.configuration_source == "API" && length(var.build_command) != 0
    error_message = "Valid build_command cannot be empty"
  }
}

variable "configuration_source" {
  type    = string
  default = ""

  validation {
    condition     = var.configuration_type == "IMAGE" || contains(["REPOSITORY", "API"], var.configuration_source)
    error_message = "Valid configuration_source values are [\"REPOSITORY\", \"API\"]"
  }
}

variable "connection_arn" {
  type    = string
  default = ""

  validation {
    condition     = var.configuration_type == "IMAGE" || length(var.connection_arn) != 0
    error_message = "Valid connection_arn cannot be empty"
  }
}

variable "directory" {
  type    = string
  default = ""
}

variable "repository_url" {
  type    = string
  default = ""

  validation {
    condition     = var.configuration_type == "IMAGE" || length(var.repository_url) != 0
    error_message = "Valid repository_url cannot be empty"
  }
}

variable "runtime" {
  type    = string
  default = ""

  validation {
    condition     = var.configuration_type == "IMAGE" || var.configuration_source == "REPOSITORY" || contains(["PYTHON_3", "NODEJS_12", "NODEJS_14", "NODEJS_16", "CORRETTO_8", "CORRETTO_11", "GO_1", "DOTNET_6", "PHP_81", "RUBY_31"], var.runtime)
    error_message = "Valid runtime values are [\"PYTHON_3\", \"NODEJS_12\", \"NODEJS_14\", \"NODEJS_16\", \"CORRETTO_8\", \"CORRETTO_11\", \"GO_1\", \"DOTNET_6\", \"PHP_81\", \"RUBY_31\"]"
  }
}

####################################
#   Image Source Configuration
####################################

variable "access_role_arn" {
  type    = string
  default = ""

  validation {
    condition     = var.configuration_type == "CODE" || var.image_repository_type == "ECR_PUBLIC" || var.image_repository_type == "ECR" && length(var.access_role_arn) != 0
    error_message = "Valid access_role_arn cannot be empty with \"ECR\" image_repository_type"
  }
}

variable "image_identifier" {
  type    = string
  default = ""

  validation {
    condition     = var.configuration_type == "CODE" || length(var.image_identifier) != 0
    error_message = "Valid image_identifier cannot be empty"
  }
}

variable "image_repository_type" {
  type    = string
  default = ""

  validation {
    condition     = var.configuration_type == "CODE" || contains(["ECR", "ECR_PUBLIC"], var.image_repository_type)
    error_message = "Valid image_repository_type values are [\"ECR\", \"ECR_PUBLIC\"]"
  }
}

####################################
#   Auto Scaling Configuration
####################################

variable "max_concurrency" {
  type = number

  validation {
    condition     = var.max_concurrency > 0
    error_message = "Valid max_concurrency should be greater than 0"
  }
}

variable "max_size" {
  type = number

  validation {
    condition     = var.max_size >= var.min_size
    error_message = "Valid max_size should be greater or equal to min_size"
  }
}

variable "min_size" {
  type = number

  validation {
    condition     = var.min_size > 0
    error_message = "Valid max_size should be greater than 0"
  }
}

####################################
#   Instance Configuration
####################################

variable "cpu" {
  type    = string
  default = "1024"

  validation {
    condition     = contains(["256", "512", "1024", "2048", "4096"], var.cpu)
    error_message = "Valid cpu values are [\"256\", \"512, \"1024\", \"2048\", \"4096\"]"
  }
}

variable "instance_role_arn" {
  type    = string
  default = null
}

variable "memory" {
  type    = string
  default = "2048"

  validation {
    condition     = contains(["512", "1024", "2048", "3072", "4096", "6144", "8192", "10240", "12288"], var.memory)
    error_message = "Valid cpu values are [\"512\", \"1024\", \"2048\", \"3072\", \"4096\", \"6144\", \"8192\", \"10240\", \"12288\"]"
  }
}

####################################
#   Health Check Configuration
####################################

variable "healthy_threshold" {
  type    = number
  default = 1

  validation {
    condition     = var.healthy_threshold > 0 && var.healthy_threshold <= 20
    error_message = "Valid healthy_threshold value must be between 1 and 20"
  }
}

variable "interval" {
  type    = number
  default = 5

  validation {
    condition     = var.interval > 0 && var.interval <= 20
    error_message = "Valid interval value must be between 1 and 20"
  }
}

variable "path" {
  type    = string
  default = "/"
}

variable "protocol" {
  type    = string
  default = "TCP"

  validation {
    condition     = contains(["TCP", "HTTP"], var.protocol)
    error_message = "Valid protocol values are [\"TCP\", \"HTTP\"]"
  }
}

variable "timeout" {
  type    = number
  default = 2

  validation {
    condition     = var.timeout > 0 && var.timeout <= 20
    error_message = "Valid timeout value must be between 1 and 20"
  }
}

variable "unhealthy_threshold" {
  type    = number
  default = 5

  validation {
    condition     = var.unhealthy_threshold > 0 && var.unhealthy_threshold <= 20
    error_message = "Valid unhealthy_threshold value must be between 1 and 20"
  }
}

####################################
#   Encryption Configuration
####################################

variable "kms_key" {
  type    = string
  default = ""
}

####################################
#   Observability Configuration
####################################

variable "enable_x_ray" {
  type    = bool
  default = false
}

####################################
#   Network Configuration
####################################

variable "enable_ingress" {
  type    = bool
  default = null
}

variable "enable_vpc_egress" {
  type    = bool
  default = false
}

variable "ip_address_type" {
  type    = string
  default = "IPV4"
}

variable "security_groups" {
  type    = list(string)
  default = []
}

variable "subnets" {
  type    = list(string)
  default = []
}

####################################
#   Domain Configuration
####################################

variable "domain_name" {
  type    = string
  default = ""
}

variable "enable_www_subdomain" {
  type    = bool
  default = true
}
