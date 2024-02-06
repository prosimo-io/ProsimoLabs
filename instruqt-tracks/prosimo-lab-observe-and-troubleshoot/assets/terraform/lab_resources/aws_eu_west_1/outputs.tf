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

output "vpc1_transit_gw_id" {
  value = module.aws_eu_west_1_vpc1.transit_gw_id
}

output "vpc2_transit_gw_id" {
  value = module.aws_eu_west_1_vpc2.transit_gw_id
}

output "vpc1_public_subnets" {
  value = module.aws_eu_west_1_vpc1.vpc_subnet
}

output "vpc2_public_subnets" {
  value = module.aws_eu_west_1_vpc2.vpc_subnet
}



# data.terraform_remote_state.lab_resources.vpc_id_<name>
# data.terraform_remote_state.lab_resources.<tgw_id>
# data.terraform_remote_state.lab_resources.public_subnets[0]