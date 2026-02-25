output "vpc_id" {
  description = "ID of the VPC."
  value       = module.this.vpc_id
}

output "vpc_cidr_block" {
  description = "CIDR block of the VPC."
  value       = module.this.vpc_cidr_block
}

output "private_subnets" {
  description = "IDs of private subnets."
  value       = module.this.private_subnets
}

output "public_subnets" {
  description = "IDs of public subnets."
  value       = module.this.public_subnets
}

output "nat_public_ips" {
  description = "Public IPs of NAT gateways."
  value       = module.this.nat_public_ips
}