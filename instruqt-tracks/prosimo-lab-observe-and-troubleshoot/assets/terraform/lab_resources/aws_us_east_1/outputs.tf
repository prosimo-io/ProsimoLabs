## Output variable definitions

output "ssh_access_aws_us_east_1" {
  value = module.aws_us_east_1_vpc1.ssh_access
}

output "ssh_access_aws_us_east_2" {
  value = module.aws_us_east_1_vpc2.ssh_access
}

# Required for Prosimo Network On-boarding
# output "vpc_id_WebSvcsProdUs" {
#   value = values(module.aws__instances_us)[*].vpc_id
# }

# data.terraform_remote_state.lab_resources.vpc_id_<name>
# data.terraform_remote_state.lab_resources.<tgw_id>
# data.terraform_remote_state.lab_resources.public_subnets[0]