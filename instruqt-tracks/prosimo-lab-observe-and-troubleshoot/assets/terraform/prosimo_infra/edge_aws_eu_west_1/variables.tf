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
  default     = "10.251.0.0/23"
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
  default     = "eu-west-1"
}


# Prosimo Edge Settings

variable "cloud_name" {
  type        = string
  description = "Prosimo Edge - name of cloud e.g. 'Prosimo_AWS'"
}

variable "cloud_region" {
  type        = string
  description = "Prosimo Edge - name of cloud_region, e.g. 'us-east-1'"
}

variable "wait_for_rollout" {
  type        = bool
  description = "Wait for edge deployment to finish - might hit API timeout before complete so default to false"
  default     = false
}
