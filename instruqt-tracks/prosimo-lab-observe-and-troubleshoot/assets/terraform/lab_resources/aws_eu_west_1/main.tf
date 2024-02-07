# Create VPC, Servers, and required resources

module "aws_eu_west_1_vpc1" {
  source = "../../modules/aws-resources"
  lab_version           = var.lab_version
  aws_region            = var.aws_region
  aws_vpc_name          = var.VPC1.aws_vpc_name
  aws_subnet_name       = var.VPC1.aws_subnet_name
  private_ip            = var.VPC1.aws_private_ip
  aws_ec2_name          = var.VPC1.aws_ec2_name
  upstream_host         = var.VPC1.upstream_host
  upstream_port         = var.VPC1.upstream_port
  aws_ec2_key_pair_name = var.VPC1.aws_ec2_key_pair_name
  aws_vpc_cidr          = var.VPC1.aws_vpc_cidr
  aws_subnet_cidr       = var.VPC1.aws_subnet_cidr
}

module "aws_eu_west_1_vpc2" {
  source = "../../modules/aws-resources"
  lab_version           = var.lab_version
  aws_region            = var.aws_region
  aws_vpc_name          = var.VPC2.aws_vpc_name
  aws_subnet_name       = var.VPC2.aws_subnet_name
  private_ip            = var.VPC2.aws_private_ip
  aws_ec2_name          = var.VPC2.aws_ec2_name
  upstream_host         = var.VPC2.upstream_host
  upstream_port         = var.VPC2.upstream_port
  aws_ec2_key_pair_name = var.VPC2.aws_ec2_key_pair_name
  aws_vpc_cidr          = var.VPC2.aws_vpc_cidr
  aws_subnet_cidr       = var.VPC2.aws_subnet_cidr
}

#Create a TGW
resource "aws_ec2_transit_gateway" "tgw_eu_west_1" {
  description = "TWG eu-west-1"
  tags = {
    Name = "tgw_eu_west_1"
  }
}

