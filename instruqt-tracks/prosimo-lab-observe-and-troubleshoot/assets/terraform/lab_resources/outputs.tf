## Output variable definitions

output "ssh_access_aws_us" {
  value = values(module.aws__instances_us)[*].ssh_access
}

output "ssh_access_aws_eu" {
  value = values(module.aws__instances_eu)[*].ssh_access
}

output "ssh_access_azure_eu" {
  value = values(module.azure_instances_eu)[*].ssh_access
}

# Required for Prosimo Network On-boarding
output "vpc_id_WebSvcsProdUs" {
  value = values(module.aws__instances_us)[*].vpc_id
}

# data.terraform_remote_state.lab_resources.vpc_id_<name>
# data.terraform_remote_state.lab_resources.<tgw_id>
# data.terraform_remote_state.lab_resources.public_subnets[0]