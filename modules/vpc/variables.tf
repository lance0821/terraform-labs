variable "name" {
  description = "VPC name."
  type        = string
}

variable "cidr" {
  description = "VPC CIDR block."
  type        = string
}

variable "azs" {
  description = "Availability zones used by the VPC."
  type        = list(string)
}

variable "private_subnets" {
  description = "Private subnet CIDR blocks (one per AZ)."
  type        = list(string)
}

variable "public_subnets" {
  description = "Public subnet CIDR blocks (one per AZ)."
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Whether to create NAT gateway resources."
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Whether to create a single shared NAT gateway."
  type        = bool
  default     = true
}

variable "one_nat_gateway_per_az" {
  description = "Whether to create one NAT gateway per AZ."
  type        = bool
  default     = false
}

variable "enable_dns_support" {
  description = "Whether to enable DNS support in the VPC."
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Whether to enable DNS hostnames in the VPC."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags applied to all VPC resources."
  type        = map(string)
  default     = {}
}

variable "public_subnet_tags" {
  description = "Additional tags for public subnets."
  type        = map(string)
  default     = {}
}

variable "private_subnet_tags" {
  description = "Additional tags for private subnets."
  type        = map(string)
  default     = {}
}