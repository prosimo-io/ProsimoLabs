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
  default     = "eu-west-1"
}

# VPCs and Servers

variable "VPC1" {
  type = object({
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
  })
}

variable "VPC2" {
  type = object({
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
  })
}

variable "lab_version" {
    type = string
}
