# Create Prosimo Infra resources

module "prosimo_resource_aws_us_east" {
  source                   = "./modules/prosimo-resources"
  prosimo_teamName         = var.prosimo_teamName
  prosimo_token            = var.prosimo_token
  prosimo_cidr             = var.prosimo_cidr
  cloud                    = "AWS"
  cloud1                   = "Prosimo_AWS"
  apply_node_size_settings = "true"
  bandwidth                = "<1 Gbps"
  instance_type            = "t3.medium"
  multipleRegion           = var.aws_region
  wait                     = "false"
}