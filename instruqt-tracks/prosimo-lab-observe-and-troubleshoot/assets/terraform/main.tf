

# Create EC2 and Networking Infrastructure in AWS

module "aws__instances_eu" {
  source = "./modules/aws-resources"
  providers = {
    aws = aws.eu-west-1
  }
  for_each              = var.EU_West_FrontEnd
  aws_region            = var.aws_region[0]
  aws_vpc_name          = each.value["aws_vpc_name"]
  aws_subnet_name       = each.value["aws_subnet_name"]
  private_ip            = each.value["private_ip"]
  tgw                   = "false"
  aws_ec2_name          = each.value["aws_ec2_name"]
  upstream_host         = each.value["upstream_host"]
  upstream_ports        = each.value["upstream_ports"]
  aws_ec2_key_pair_name = each.value["aws_ec2_key_pair_name"]

  aws_vpc_cidr    = each.value["aws_vpc_cidr"]
  aws_subnet_cidr = each.value["aws_subnet_cidr"]

}

module "aws__instances_us" {
  source = "./modules/aws-resources"
  providers = {
    aws = aws.us-east-1
  }
  for_each              = var.US_East_FrontEnd
  aws_region            = var.aws_region[1]
  aws_vpc_name          = each.value["aws_vpc_name"]
  aws_subnet_name       = each.value["aws_subnet_name"]
  private_ip            = each.value["private_ip"]
  tgw                   = "false"
  aws_ec2_name          = each.value["aws_ec2_name"]
  upstream_host         = each.value["upstream_host"]
  upstream_ports        = each.value["upstream_ports"]
  aws_ec2_key_pair_name = each.value["aws_ec2_key_pair_name"]

  aws_vpc_cidr    = each.value["aws_vpc_cidr"]
  aws_subnet_cidr = each.value["aws_subnet_cidr"]

}

# Create Linux and Networking Infrastructure in Azure

module "azure_instances_eu" {
  source = "./modules/azure-resources"
  providers = {
    azurerm = azurerm.eun
  }
  for_each                   = var.North_EU_AppSvcs_VNets
  azure_resource_group       = each.value["azure_resource_group"]
  azure_location             = "North Europe"
  azure_vnet_name            = each.value["azure_vnet_name"]
  azure_subnet_name          = each.value["azure_subnet_name"]
  azure_instance_name        = each.value["azure_instance_name"]
  server_ports               = each.value["server_ports"]
  azure_private_ip           = each.value["azure_private_ip"]
  azure_server_key_pair_name = each.value["azure_server_key_pair_name"]
  azure_vm_size              = "Standard_DS1_v2"
  azure_admin_username       = "linuxuser"
  azure_admin_password       = "admin123"

  azure_subnet_cidr = each.value["azure_subnet_cidr"]
  azure_vnet_cidr   = each.value["azure_vnet_cidr"]
}

resource "aws_ec2_transit_gateway" "eu_west_tgw" {
  #  provider = aws.eu-aws
  provider    = aws.eu-west-1
  description = "EU_WEST_TGW"
  tags = {
    Name = "TGW"
  }
}

/*
# Onboard Networks to Prosimo Fabric

module "network_eu" {
  source = "./modules/prosimo-network"
  prosimo_team_name = var.prosimo_team_name
  prosimo_token = var.prosimo_token
  name         = "WEB_Subnet_EU"
  region       = var.aws_region[0]
  subnets      = var.subnet_cidr[0]
  connectivity_type  = "vpc-peering"
  placement    = "Workload VPC"
  cloud        = "AWS"
  cloud_type   = "public"
  connectType  = "private"
  vpc          = module.aws__instances_eu.aws_vpc_id
  cloudNickname= "Prosimo"
  decommission = "false"
  onboard      = "true"
  depends_on   = [ module.prosimo_resource ] 
}



resource "aws_ec2_transit_gateway" "dev" {
provider = aws.eu-aws
description = "DEV"
tags = {
    Name = "DEV"
  }
}



# Create Virtual Instance and Networking Infrastructre in Azure
module "azure_instances_1" {
  source = "./modules/azure-resources"

  azure_resource_group = "demo_IaC_basic"
  azure_location       = "North Europe"
  azure_vnet_name      = "vnet_1"
  azure_subnet_name    = "subnet_1"
  azure_instance_name  = "vm_1"
  azure_vm_size        = "Standard_DS1_v2"
  azure_admin_username = "$test"
  azure_admin_password = "Test2022"

  azure_subnet_cidr = "10.0.0.0/16"
  azure_vnet_cidr   = "10.0.0.0/24"
}
*/
