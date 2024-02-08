## Output variable definitions

output "ssh_access_aws_eu_west_1" {
  value = module.aws_eu_west_1_vpc1.ssh_access
}

output "ssh_access_aws_eu_west_2" {
  value = module.aws_eu_west_1_vpc2.ssh_access
}

output "vpc1_id" {
  value = module.aws_eu_west_1_vpc1.aws_vpc_id
}

output "vpc2_id" {
  value = module.aws_eu_west_1_vpc2.aws_vpc_id
}

output "tgw_eu_west_1" {
  value = aws_ec2_transit_gateway.tgw_eu_west_1.id
}

output "vpc1_public_subnets" {
  value = module.aws_eu_west_1_vpc1.vpc_subnet
}

output "vpc2_public_subnets" {
  value = module.aws_eu_west_1_vpc2.vpc_subnet
}
