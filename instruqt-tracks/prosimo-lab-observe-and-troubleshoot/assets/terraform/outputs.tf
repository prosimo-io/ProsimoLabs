## Output variable definitions
# Print AWS Instance Public
output "aws_ec2_public_ip_eu" {
  value = values(module.aws__instances_eu)[*].aws_eip_public_ip
}

output "aws_ec2_public_ip_us" {
  value = values(module.aws__instances_us)[*].aws_eip_public_ip
}

output "prosimo_cloud_nickname" {
  value = prosimo_cloud_creds.aws.nickname
}

# Print Azure Instance Public
output "azure_vm_public_ip_eu" {
  value = values(module.azure_instances_eu)[*].azure_vm_public_ip
}
