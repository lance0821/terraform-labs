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

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC."
}

variable "vpc_azs" {
  type        = list(string)
  description = "Availability zones used for VPC subnets."
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public subnet CIDR blocks (one per AZ)."
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private subnet CIDR blocks (one per AZ)."
}

variable "enable_nat_gateway" {
  type        = bool
  description = "Whether to create NAT gateway resources."
  default     = true
}

variable "single_nat_gateway" {
  type        = bool
  description = "Whether to create a single shared NAT gateway."
  default     = true
}

variable "one_nat_gateway_per_az" {
  type        = bool
  description = "Whether to create one NAT gateway per AZ."
  default     = false
}

variable "public_subnet_tags" {
  type        = map(string)
  description = "Extra tags applied to public subnets."
  default     = {}
}

variable "private_subnet_tags" {
  type        = map(string)
  description = "Extra tags applied to private subnets."
  default     = {}
}