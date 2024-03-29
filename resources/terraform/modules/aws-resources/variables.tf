## Input variable definitions
variable "lab_version" {
  description = "Lab Release Version (github tag)"
  type = string
}

# AWS

variable "aws_region" {
  description = "Region of AWS"
  type        = string
}

variable "aws_vpc_name" {
  description = "Name of VPC"
  type        = string
}

variable "aws_vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "aws_subnet_cidr" {
  description = "Subnet CIDR"
  type        = string
}

variable "aws_subnet_name" {
  description = "Name of Subnet"
  type        = string
}

variable "aws_ec2_name" {
  description = "Name of EC2"
  type        = string
}

variable "upstream_host" {
  description = "upstream_host"
  type        = string
}

variable "upstream_port" {
  description = "upstream_port"
  type        = string
}

variable "aws_ec2_instance_type" {
  description = "Instance Type of EC2"
  type        = string
  default     = "t3.micro"
}

variable "private_ip" {
  description = "Static IP for EC2"
  type        = string
}

variable "aws_ec2_key_pair_name" {
  description = "Key Pair Name for EC2"
  type        = string
}

variable "igw_name" {
  description = "Name of IGW"
  default     = ""
}

variable "rt_name" {
  description = "Name of RT"
  default     = ""
}
