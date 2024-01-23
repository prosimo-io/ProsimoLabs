module "aws_us_east_1_vpc1" {
  source = "../modules/aws-resources"
  lab_version           = var.lab_version
  aws_region            = var.aws_region
  aws_vpc_name          = var.VPC1.aws_vpc_name
  aws_subnet_name       = var.VPC1.aws_subnet_name
  private_ip            = var.VPC1.aws_private_ip
  tgw                   = true
  aws_ec2_name          = var.VPC1.aws_ec2_name
  upstream_host         = var.VPC1.upstream_host
  upstream_port         = var.VPC1.upstream_port
  aws_ec2_key_pair_name = var.VPC1.aws_ec2_key_pair_name
  aws_vpc_cidr          = var.VPC1.aws_vpc_cidr
  aws_subnet_cidr       = var.VPC1.aws_subnet_cidr
}

module "aws_us_east_1_vpc2" {
  source = "../modules/aws-resources"
  lab_version           = var.lab_version
  aws_region            = var.aws_region
  aws_vpc_name          = var.VPC2.aws_vpc_name
  aws_subnet_name       = var.VPC2.aws_subnet_name
  private_ip            = var.VPC2.aws_private_ip
  tgw                   = true
  aws_ec2_name          = var.VPC2.aws_ec2_name
  upstream_host         = var.VPC2.upstream_host
  upstream_port         = var.VPC2.upstream_port
  aws_ec2_key_pair_name = var.VPC2.aws_ec2_key_pair_name
  aws_vpc_cidr          = var.VPC2.aws_vpc_cidr
  aws_subnet_cidr       = var.VPC2.aws_subnet_cidr
}


resource "prosimo_network_onboarding" "aws_us_east_1" {

  name = var.network_name
  namespace = var.network_namespace
  network_exportable_policy = false
  public_cloud {
    cloud_type = var.cloud_type
    connection_option = var.connection_option
    cloud_creds_name = "Prosimo_AWS"
    region_name = var.aws_region # get from remote state file?
    cloud_networks {
      vpc = module.aws_us_east_1_vpc1.aws_vpc_id # data.terraform_remote_state.lab_resources.vpc_id_<name>
      hub_id = module.aws_eu_west_1_vpc1.transit_gw_id # data.terraform_remote_state.lab_resources.<tgw_id>
      connector_placement = "Infra VPC"
      connectivity_type = "transit-gateway"
      subnets {
        subnet = var.VPC1.aws_subnet_cidr # data.terraform_remote_state.lab_resources.public_subnets[0]
        # virtual_subnet = "10.250.2.128/25" # Required for overlapping IP
      }
      connector_settings {
        bandwidth_range {
            min = 1
            max = 1
        }
      }
    }
    connect_type = "connector"
  }
  policies = ["ALLOW-ALL-NETWORKS"]
  onboard_app = false
  decommission_app = false
}
