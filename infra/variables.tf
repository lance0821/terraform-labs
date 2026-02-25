variable "project_name" {
  type        = string
  description = "Short project slug for naming."
}

variable "environment" {
  type        = string
  description = "dev|staging|prod"
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be dev, staging, or prod."
  }
}

variable "extra_tags" {
  type    = map(string)
  default = {}
}