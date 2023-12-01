variable "prosimo_teamName" {
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
}

variable "aws_region" {
  type        = string
  description = "Region for AWS resoruces"
}
