# Prosimo Provider

variable "prosimo_team_name" {
  type        = string
  description = "valid name of the tenant"
}

variable "prosimo_token" {
  type        = string
  description = "valid prosimo token - from MSP Portal"
}

# AWS Provider

variable "aws_access_key_id" {
  type        = string
  description = "valid AWS Key"
}

variable "aws_secret_key_id" {
  type        = string
  description = "valid AWS Secret"
}

variable "aws_region" {
  type        = string
  description = "Region for AWS resoruces"
  default     = "us-eest-1"
}

# VPCs and Servers

variable "VPC1" {
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

variable "VPC2" {
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

variable "lab_version" {
    type = string
}

# Network Onboarding

variable "network_name" {
  type        = string
  description = "Name of the Prosimo Network"
  default     = "aws_us_east_1"
}

variable "network_namespace" {
  type        = string
  description = "Name of the Prosimo Namespace to on-board network into"
  default     = "default"
}

variable "cloud_type" {
  type        = string
  description = "Name of the Prosimo Namespace to on-board network into"
  default     = "public"
}

variable "connection_option" {
  type        = string
  description = "Name of the Prosimo Namespace to on-board network into"
  default     = "private"
}
