variable "lab_version" {
  type        = string
  description = "Release Version (GitHub Tag) of this Lab"
}

variable "prosimo_team_name" {
  type        = string
  description = "valid name of the tenant"
}

variable "prosimo_token" {
  type        = string
  description = "valid prosimo token - from MSP Portal"
}

variable "aws_region" {
  type        = list(string)
  description = "Region for AWS resoruces"
}

variable "aws_access_key_id" {
  type        = string
  description = "valid AWS Key"
}

variable "aws_secret_key_id" {
  type        = string
  description = "valid AWS Secret"
}

variable "azure_subscription_id" {
  type        = string
  description = "azure subscription id"
}

variable "azure_client_id" {
  type        = string
  description = "azure client id"
}

variable "azure_client_secret" {
  type        = string
  description = "azure client secret"
}

variable "azure_tenant_id" {
  type        = string
  description = "azure tenant id"
}

variable "US_East_FrontEnd" {
  type = map(object({
    aws_vpc_name          = string
    igw_name              = string
    rt_name               = string
    aws_subnet_name       = string
    aws_private_ip        = string
    aws_ec2_name          = string
    upstream_host         = string
    upstream_port         = string
    aws_ec2_key_pair_name = string
    aws_vpc_cidr          = string
    aws_subnet_cidr       = string
  }))
}

variable "EU_West_FrontEnd" {
  type = map(object({
    aws_vpc_name          = string
    igw_name              = string
    rt_name               = string
    aws_subnet_name       = string
    aws_private_ip        = string
    aws_ec2_name          = string
    upstream_host         = string
    upstream_port         = string
    aws_ec2_key_pair_name = string
    aws_vpc_cidr          = string
    aws_subnet_cidr       = string
  }))
}

variable "North_EU_AppSvcs_VNets" {
  type = map(object({
    azure_resource_group       = string
    azure_location             = string
    azure_vnet_name            = string
    azure_subnet_name          = string
    azure_instance_name        = string
    server_port                = string
    azure_server_key_pair_name = string
    azure_private_ip           = string
    azure_vm_size              = string
    azure_admin_username       = string
    azure_subnet_cidr          = string
    azure_vnet_cidr            = string
    azure_admin_password       = string
  }))
}
