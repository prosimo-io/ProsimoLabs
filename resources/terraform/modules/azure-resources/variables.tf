## Input variable definitions
variable "lab_version" {
  description = "Lab Release Version (github tag)"
  type = string
}

# Azure

variable "azure_resource_group" {
  description = "Name of Resource Group"
  type        = string
}

variable "azure_location" {
  description = "Location of Resource Group"
  type        = string
}

variable "azure_vnet_name" {
  description = "Name of VPC"
  type        = string
}

variable "azure_private_ip" {
  description = "Private IP for VM"
  type        = string
}

variable "azure_server_key_pair_name" {
  description = "SSH Key Name"
  type        = string
}

variable "azure_vnet_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "azure_subnet_cidr" {
  description = "Subnet CIDR"
  type        = string
}

variable "azure_subnet_name" {
  description = "Name of Subnet"
  type        = string
}

variable "azure_instance_name" {
  description = "Name of the Instance"
  type        = string
}

variable "server_port" {
  description = "server_port"
  type        = string
}

variable "azure_vm_size" {
  description = "VM Size of the Instance"
  type        = string
  default     = "Standard_DS1_v2"
}

variable "azure_admin_username" {
  description = "Admin Username for Instance"
  type        = string
}

variable "azure_admin_password" {
  description = "Admin Password for Instance"
  type        = string
}
