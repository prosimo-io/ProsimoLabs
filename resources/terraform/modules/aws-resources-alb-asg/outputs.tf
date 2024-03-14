output "aws_vpc_id" {
  value = module.vpc.default_vpc_id
}

output "vpc_subnet" {
  value = module.vpc.public_subnets
}