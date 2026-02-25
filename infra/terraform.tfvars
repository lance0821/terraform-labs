project_name = "lance-labs"
environment  = "dev"
extra_tags = {
  Owner = "Lance"
  Team  = "DevOps"
}

vpc_cidr             = "10.10.0.0/16"
vpc_azs              = ["us-east-1a", "us-east-1b"]
public_subnet_cidrs  = ["10.10.0.0/24", "10.10.1.0/24"]
private_subnet_cidrs = ["10.10.10.0/24", "10.10.11.0/24"]
