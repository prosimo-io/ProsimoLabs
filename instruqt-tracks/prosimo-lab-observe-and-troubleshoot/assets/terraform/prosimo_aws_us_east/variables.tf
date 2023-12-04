variable "prosimo_team_name" {
  type        = string
  description = "valid name of the tenant"
}

variable "prosimo_token" {
  type        = string
  description = "valid prosimo token - from MSP Portal"
}

variable "prosimo_cidr" {
  type        = string
  description = "valid subnets to assign to server"
  default     = "10.252.0.0/23"
}

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
  default     = "us-east-1"
}