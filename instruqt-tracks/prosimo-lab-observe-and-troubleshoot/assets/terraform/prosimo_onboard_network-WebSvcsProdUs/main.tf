# Onboard Networks to Prosimo Fabric

/*
module "network_eu" {
  source            = "../modules/prosimo-network"
  prosimo_team_name = var.prosimo_team_name
  prosimo_token     = var.prosimo_token
  name              = "WEB_Subnet_EU"
  region            = var.aws_region[0]
  subnets           = var.subnet_cidr[0]
  connectivity_type = "vpc-peering"
  placement         = "Workload VPC"
  cloud             = "AWS"
  cloud_type        = "public"
  connect_type      = "private"
  vpc               = module.aws__instances_eu.aws_vpc_id
  cloud_creds_name  = "Prosimo"
  decommission      = "false"
  onboard           = "true"
  depends_on        = [module.prosimo_resource]
}
*/


// Remote Data Source
// "../lab_resources/"

data "terraform_remote_state" "lab_resources" {
  backend = "local"
  config = {
    path = "../lab_resources/terraform.tfstate"
  }
}

/*
Remote State Output List
data.terraform_remote_state.lab_resources.vpc_id_<name>
data.terraform_remote_state.lab_resources.<tgw_id>
data.terraform_remote_state.lab_resources.public_subnets[0]
*/

#AWS with transit gateway and infra vpc
resource "prosimo_network_onboarding" "WebSvcsProdUs" {

  name = var.network_name
  namespace = var.network_namespace
  network_exportable_policy = false
  public_cloud {
    cloud_type = var.cloud_type
    connection_option = var.connection_option
    cloud_creds_name = "prosimo-aws-iam" # Can this be any string??
    region_name = var.aws_region # get from remote state file?
    cloud_networks {
      vpc = "vpc-a8892dc3" # data.terraform_remote_state.lab_resources.vpc_id_<name>
      hub_id = "tgw-04d69a6cd846cd26b" # data.terraform_remote_state.lab_resources.<tgw_id>
      connector_placement = "Infra VPC"
      connectivity_type = "transit-gateway"
      subnets {
        subnet = "10.250.2.128/25" # data.terraform_remote_state.lab_resources.public_subnets[0]
        # virtual_subnet = "10.250.2.128/25" # Required for overlapping IP
      }
#      subnets {
#        subnet = "10.250.3.128/25" # hard set from vpc settings
#        # virtual_subnet = "10.250.3.128/25" # Required for overlapping IP
#      }
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
