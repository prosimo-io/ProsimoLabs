## Output variable definitions

output "ssh_access_aws_us_east_1" {
  value = module.aws_us_east_1_vpc1.ssh_access
}

output "aws_ec2_public_ip1" {
  value = module.aws_us_east_1_vpc1.aws_eip_public_ip
}

output "ssh_access_aws_us_east_2" {
  value = module.aws_us_east_1_vpc2.ssh_access
}

output "aws_ec2_public_ip2" {
  value = module.aws_us_east_1_vpc2.aws_eip_public_ip
}

output "vpc1_id" {
  value = module.aws_us_east_1_vpc1.aws_vpc_id
}

output "vpc2_id" {
  value = module.aws_us_east_1_vpc2.aws_vpc_id
}

output "tgw_us_east_1_id" {
  value = aws_ec2_transit_gateway.tgw_us_east_1.id
}

output "vpc1_public_subnets" {
  value = module.aws_us_east_1_vpc1.vpc_subnet
}

output "vpc2_public_subnets" {
  value = module.aws_us_east_1_vpc2.vpc_subnet
}
