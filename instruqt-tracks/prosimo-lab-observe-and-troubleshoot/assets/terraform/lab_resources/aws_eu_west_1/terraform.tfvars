VPC1 = {
  aws_vpc_name          = "WebSvcsProdEu"
  igw_name              = "WebSvcsProdEu-IGW"
  rt_name               = "WebSvcsProdEu-RT"
  aws_subnet_name       = "WebSvcsProdEu-Subnet"
  aws_private_ip        = "10.4.0.100"
  aws_ec2_name          = "WebServerProdEu1"
  upstream_host         = "10.0.0.100"
  upstream_port         = "3000"
  aws_ec2_key_pair_name = "EU_WEST_WebSvcsProd"
  aws_vpc_cidr          = "10.4.0.0/16"
  aws_subnet_cidr       = "10.4.0.0/24"
}

VPC2 = {
  aws_vpc_name          = "WebSvcsDevEu"
  igw_name              = "WebSvcsDevEu-IGW"
  rt_name               = "WebSvcsDevEu-RT"
  aws_subnet_name       = "WebSvcsDevEu-Subnet"
  aws_private_ip        = "10.5.0.100"
  aws_ec2_name          = "WebServerDevEu1"
  upstream_host         = "10.1.0.100"
  upstream_port         = "3000"
  aws_ec2_key_pair_name = "EU_WEST_WebSvcsDev"
  aws_vpc_cidr          = "10.5.0.0/16"
  aws_subnet_cidr       = "10.5.0.0/24"
}
